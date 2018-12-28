using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ShopCart : System.Web.UI.Page
{
    MyBookShopDataContext db = new MyBookShopDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["BookId"] != null)
            {
                int bookId = int.Parse(Request.QueryString["BookId"]);
                AddBook(bookId);
            }
            lblHint.Text = "温馨提示：更改购买数量后，请单击'重新计算'按钮进行更新！";
            Bind();
        }
    }
    /// <summary>
    /// 将指定图书号的图书添加到购物车，购物车以Profile形式存储
    /// </summary>
    /// <param name="bookId">指定的图书号</param>
    protected void AddBook(int bookId)
    {
        //isExit表示商品是否已在购物车中，值1表示“是”，值0表示“否”
        int isExit = 0;
        for (int j = 0; j < Profile.Cart.Name.Count; j++)
        {
            //若同类图书已经存在于购物车中，则将该图书的购买数量加1
            if (bookId == (int)Profile.Cart.BookId[j])
            {
                int qty = (int)Profile.Cart.Qty[j];
                qty++;
                Profile.Cart.Qty[j] = qty;
                Profile.Save();
                isExit = 1;
            }
        }
        if (isExit == 0)
        {
            //若购物车中无指定图书编号的图书，则添加一个新图书到Profile.Cart的各个属性中
            var books = from p in db.Book
                           where p.BookId == bookId.ToString()
                           select p;
            foreach (var book in books)
            {
                Profile.Cart.ListPrice.Add(book.ListPrice);
                Profile.Cart.Qty.Add(1);
                Profile.Cart.BookId.Add(book.BookId);
                Profile.Cart.Name.Add(book.Name);
            }
            Profile.Save();
        }
    }
    /// <summary>
    /// 将Profile.Cart中的购物记录放在一个临时表dt中,再将dt作为数据源，绑定到gvCart
    /// </summary>
    protected void Bind()
    {
        Profile.Cart.TotalPrice = TotalPrice().ToString();
        lblTotalPrice.Text = Profile.Cart.TotalPrice;
        DataTable dt = new DataTable();
        dt.Columns.Add("BookId");
        dt.Columns.Add("Name");
        dt.Columns.Add("ListPrice");
        dt.Columns.Add("Qty");
        for (int i = 0; i < Profile.Cart.Name.Count; i++)
        {
            DataRow row = dt.NewRow();
            row[0] = Profile.Cart.BookId[i];
            row[1] = Profile.Cart.Name[i];
            row[2] = Profile.Cart.ListPrice[i];
            row[3] = Profile.Cart.Qty[i];
            dt.Rows.Add(row);
        }
        gvCart.DataSource = dt;
        gvCart.DataBind();
        if (gvCart.Rows.Count != 0)
        {
            pnlCart.Visible = true;
            lblCart.Text = "";
        }
        else
        {
            pnlCart.Visible = false;
            lblCart.Text = "购物车内无商品，请先购物！";
        }
    }

    /// <summary>
    /// 计算购物车中购物总金额
    /// </summary>
    /// <returns>返回总金额</returns>
    protected decimal TotalPrice()
    {
        decimal sum = 0;
        for (int j = 0; j < Profile.Cart.Name.Count; j++)
        {
            int qty = (int)Profile.Cart.Qty[j];
            decimal listPrice = (decimal)Profile.Cart.ListPrice[j];
            sum += qty * listPrice;
        }
        return sum;
    }

    /// <summary>
    /// 循环利用FindControl()找到CheckBox控件chkBook，然后判断其Checked值，若为True，则调用自定义方法DeleteBook()执行删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int bookId = 0;
        GridView gvCart = new GridView();
        gvCart = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("gvCart");
        if (gvCart != null)
        {
            for (int i = 0; i < gvCart.Rows.Count; i++)
            {
                CheckBox chkBook = new CheckBox();
                chkBook = (CheckBox)gvCart.Rows[i].FindControl("chkBook");
                if (chkBook != null)
                {
                    if (chkBook.Checked)
                    {
                        bookId = int.Parse(gvCart.Rows[i].Cells[1].Text);
                        DeleteBook(bookId);  //调用自定义方法DeleteBook()删除购物车中指定图书编号的图书
                    }
                }
            }
        }
        Bind();  //调用自定义方法Bind()显示购物车中图书
    }

    /// <summary>
    /// 在购物车Profile.Cart中删除指定图书编号的购物记录
    /// </summary>
    /// <param name="bookId">指定的图书编号</param>
    protected void DeleteBook(int bookId)
    {
        //循环查找与id相匹配图书对应的数组列表下标,并存储到变量j
        int j = 0;
        for (int i = 0; i < Profile.Cart.Name.Count; i++)
        {
            if (bookId == (int)Profile.Cart.BookId[i])
            {
                j = i;
                break;
            }
        }
        //移除指定下标的数组元素
        Profile.Cart.ListPrice.RemoveAt(j);
        Profile.Cart.BookId.RemoveAt(j);
        Profile.Cart.Name.RemoveAt(j);
        Profile.Cart.Qty.RemoveAt(j);
        Profile.Save();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        //调用各数组列表对象的Clear()方法清除数组列表内容
        Profile.Cart.Qty.Clear();
        Profile.Cart.Name.Clear();
        Profile.Cart.BookId.Clear();
        Profile.Cart.ListPrice.Clear();
        Profile.Save();
        Response.Redirect("Default.aspx");
    }

    protected void btnComputeAgain_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        //循环利用FindControl()找到TextBox控件txtQty，然后判断是否为空值，若非空，则在Product表中查找txtQty所在行图书编号确定的图书，从而比较txtQty中的输入值和商品的库存量
        GridView gvCart = new GridView();
        gvCart = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("gvCart");
        if (gvCart != null)
        {
            for (int i = 0; i < gvCart.Rows.Count; i++)
            {
                TextBox txtQty = new TextBox();
                txtQty = (TextBox)gvCart.Rows[i].FindControl("txtQty");
                if (txtQty != null)
                {
                    var book = (from p in db.Book
                                   where p.BookId == gvCart.Rows[i].Cells[1].Text
                                   select p).First();

                    if (int.Parse(txtQty.Text) > book.Qty)  //库存不足
                    {
                        lblError.Text += "Error：库存不足，图书名为 " + gvCart.Rows[i].Cells[2].Text + " 的库存数量为 " + book.Qty.ToString() + "<br />";
                    }
                    else
                    {
                        ChangeQty(int.Parse(gvCart.Rows[i].Cells[1].Text), int.Parse(txtQty.Text));  //调用自定义方法ChangeQty()改变存储在Profile中的购买数量
                    }
                }

            }
        }
        Bind();  //调用自定义方法Bind()显示购物车中商品
    }

    /// <summary>
    /// 根据指定的图书编号，修改Profile中对应图书的库存量
    /// </summary>
    /// <param name="bookId">指定的图书编号</param>
    /// <param name="qty">Profile中对应图书的库存量</param>
    protected void ChangeQty(int bookId, int qty)
    {
        for (int i = 0; i < Profile.Cart.Name.Count; i++)
        {
            if (bookId == (int)Profile.Cart.BookId[i])
            {
                Profile.Cart.Qty[i] = qty;
                Profile.Save();
            }
        }
    }

    protected void btnSettle_Click(object sender, EventArgs e)
    {
        //如果不为匿名访问，则转到订单地址提交页面，否则转到登录页面
        if (User.Identity.IsAuthenticated)
        {
            Response.Redirect("SubmitCart.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

}