using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_BookMaster : System.Web.UI.Page
{
    MyBookShopDataContext db = new MyBookShopDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();  //调用自定义方法Bind()
        }
    }

    /// <summary>
    /// 显示Product表数据
    /// </summary>
    protected void Bind()
    {
        var books = from b in db.Book
                       select b;
        if (books.Count() == 0)
        {
            pnlProduct.Visible = false;
            lblProErr.Text = "数据库中无商品，请添加！";
        }
        else
        {
            pnlProduct.Visible = true;
            lblProErr.Text = "";
        }
        gvProduct.DataSource = books;
        gvProduct.DataBind();
    }


    protected void gvProduct_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvProduct.PageIndex = e.NewPageIndex;
        Bind();  //调用自定义方法Bind()
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string bookId = "";
        GridView gvProduct = new GridView();
        gvProduct = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("gvProduct");
        if (gvProduct != null)
        {
            for (int i = 0; i < gvProduct.Rows.Count; i++)
            {
                CheckBox chkChoice = new CheckBox();
                chkChoice = (CheckBox)gvProduct.Rows[i].FindControl("chkChoice");
                if (chkChoice != null)
                {
                    if (chkChoice.Checked)
                    {
                        bookId = gvProduct.Rows[i].Cells[1].Text;
                        DeletePro(bookId);  //调用自定义方法DeletePro()
                    }
                }

            }
        }
        Bind();  //调用自定义方法Bind()
    }

    /// <summary>
    /// 删除指定商品编号的产品信息
    /// </summary>
    /// <param name="productId">指定的商品编号</param>
    protected void DeletePro(string bookId)
    {
        var book = (from b in db.Book
                       where b.BookId == bookId
                       select b).First();
        string filePath = Server.MapPath("~") + book.Image.Substring(1);
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
        }
        db.Book.DeleteOnSubmit(book);
        db.SubmitChanges();
    }
}