using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class BookShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count == 0)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            Bind();  //调用自定义方法Bind()
        }
    }

    /// <summary>
    /// 根据从NewProduct.ascx、Category.ascx、PetTree.ascx传递过来的BookId或CategoryId值，显示与BookId值相等的单个商品信息，或者显示CategoryId确定的分类中所有的商品信息
    /// </summary>
    protected void Bind()
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        
        if (Request.QueryString["BookId"] != null)
        {
            string bookId = Request.QueryString["BookId"];
            var books = from b in db.Book
                           where b.BookId == bookId
                           select b;
            gvBook.DataSource = books;
            gvBook.DataBind();
        }
        if (Request.QueryString["CategoryId"] != null)
        {
            int categoryId = int.Parse(Request.QueryString["CategoryId"]);
            var products = from b in db.Book
                           where b.CategoryId == categoryId
                           select b;
            gvBook.DataSource = products;
            gvBook.DataBind();
        }
    }

    protected void gvBook_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvBook.PageIndex = e.NewPageIndex;
        Bind();  //调用自定义方法Bind()
    }
}