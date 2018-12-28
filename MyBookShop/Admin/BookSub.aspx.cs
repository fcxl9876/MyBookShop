using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Admin_BookSub : System.Web.UI.Page
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
    /// 根据从ProductMaster.aspx传递过来的ProductId值，显示与ProductId值相等的商品信息
    /// </summary>
    protected void Bind()
    {
        if (Request.QueryString["BookId"] == null)
        {
            pnlProduct.Visible = false;
        }
        else
        {
            string bookId = Request.QueryString["BookId"];
            var book = (from b in db.Book
                           where b.BookId == bookId
                           select b).First();

            var categories = from c in db.Category
                             select c;
            foreach (var category in categories)
            {
                ddlCategoryId.Items.Add(new ListItem(category.Name, category.CategoryId.ToString()));
            }

            var presses = from s in db.Press
                            select s;
            foreach (var press in presses)
            {
                ddlPressId.Items.Add(new ListItem(press.Name, press.PressId.ToString()));
            }

            txtName.Text = book.Name;
            ddlCategoryId.SelectedValue = book.CategoryId.ToString();
            txtListPrice.Text = book.ListPrice.ToString();
            txtAuthor.Text = book.Author.ToString();
            ddlPressId.SelectedValue = book.PressId.ToString();
            txtDescn.Text = book.Descn;
            txtQty.Text = book.Qty.ToString();
            imgImage.ImageUrl = book.Image;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["BookId"] != null)
        {
            string bookId = Request.QueryString["BookId"];
            var book = (from b in db.Book
                           where b.BookId == bookId
                           select b).First();
            book.Name = txtName.Text.Trim();
            book.CategoryId = int.Parse(ddlCategoryId.SelectedValue);
            book.PressId = int.Parse(ddlPressId.SelectedValue);
            book.ListPrice = decimal.Parse(txtListPrice.Text.Trim());
            book.Author = txtAuthor.Text.Trim();
            book.Descn = txtDescn.Text.Trim();
            book.Qty = int.Parse(txtQty.Text.Trim());

            //如果有上传文件，就删除原来的图片，保存上传的图片
            if (fupImage.PostedFile.ContentLength != 0)
            {
                string filePath = Server.MapPath("~/") + book.Image.Substring(2);
                File.Delete(filePath);
                fupImage.PostedFile.SaveAs(filePath);
            }
            db.SubmitChanges();
            //清空页面缓存
            Response.Buffer = true;
            //重定向到Admin文件夹中的BookMaster.aspx
            Response.Redirect("BookMaster.aspx");
        }
    }
}