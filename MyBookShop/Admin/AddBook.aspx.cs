using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Admin_AddBook : System.Web.UI.Page
{
    MyBookShopDataContext db = new MyBookShopDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (IsExitCS())  //调用自定义方法IsExitCS()
            {
                pnlProductMaster.Visible = false;
                lblMsg.Text = "请先添加分类和出版社！";
            }
            else
            {
                pnlProductMaster.Visible = true;
                lblMsg.Text = "";
                Bind();  //调用自定义方法Bind()
            }
        }
    }

    /// <summary>
    /// IsExitCS()方法判断Category和Supplier表中是否已有数据
    /// </summary>
    /// <returns>返回值true表示Category或Supplier表中无数据；返回值false表示Category和Supplier表中都有数据</returns>
    protected bool IsExitCS()
    {
        var categories = from c in db.Category
                         select c;
        var presses = from c in db.Press
                        select c;
        if (categories.Count() == 0 || presses.Count() == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// 自定义方法Bind()用于填充“商品分类”下拉列表和“提供商”下拉列表的值
    /// </summary>
    protected void Bind()
    {
        var categories = from c in db.Category
                         select c;
        foreach (var category in categories)
        {
            ddlCategoryId.Items.Add(new ListItem(category.Name, category.CategoryId.ToString()));
        }

        var presses = from c in db.Press
                        select c;
        foreach (var press in presses)
        {
            ddlPressId.Items.Add(new ListItem(press.Name, press.PressId.ToString()));
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsExitBook(txtName.Text.Trim()))  //输入的商品名已存在
        {
            lblNameErr.Text = "商品已经存在";
        }
        else  //添加商品到Book表
        {
            Book book = new Book();
            string fileName;
            string fileFolder;
            fileName = Path.GetFileName(fupImage.PostedFile.FileName);
            fileFolder = Server.MapPath("~/") + "Images\\bookimg\\" + ddlCategoryId.SelectedItem.Text + "\\";
            fileFolder = fileFolder + fileName;
            fupImage.PostedFile.SaveAs(fileFolder);

            book.Image = "~\\Images\\bookimg\\" + ddlCategoryId.SelectedItem.Text + "\\" + fileName;
            book.Name = txtName.Text.Trim();
            book.CategoryId = int.Parse(ddlCategoryId.SelectedValue);
            book.PressId = int.Parse(ddlPressId.SelectedValue);
            book.ListPrice = decimal.Parse(txtListPrice.Text.Trim());
            book.Author = txtAuthor.Text.Trim();
            book.Descn = txtDescn.Text.Trim();
            book.Qty = int.Parse(txtQty.Text.Trim());

            db.Book.InsertOnSubmit(book);
            db.SubmitChanges();
            Response.Redirect("BookMaster.aspx");
        }
    }

    /// <summary>
    /// IsExitProduct()判断是否存在指定的商品
    /// </summary>
    /// <param name="name">指定的商品名</param>
    /// <returns>返回值true表示Product表中存在指定的商品；返回值false表示Product表中不存在指定的商品</returns>
    protected bool IsExitBook(string name)
    {
        var products = from c in db.Book
                       where c.Name == name
                       select c;
        if (products.Count() != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}