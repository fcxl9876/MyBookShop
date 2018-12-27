using System;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();  //调用自定义方法Bind()
        }
    }

    /// <summary>
    /// 根据从MasterPage.master传递过来的SearchText值，模糊查询与SearchText值匹配的所有商品信息并显示
    /// </summary>
    protected void Bind()
    {
        if (Request.QueryString["SearchText"] != null)
        {
            string strSearchText = Request.QueryString["SearchText"].ToString();
            MyBookShopDataContext db = new MyBookShopDataContext();
            var books = from b in db.Book
                           where SqlMethods.Like(b.Name, "%" + strSearchText.Trim() + "%")
                           select b;
            gvBook.DataSource = books;
            gvBook.DataBind();
        }
        else
        {
            lblError.Text = "无搜索结果！";
        }
    }

    protected void gvBook_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvBook.PageIndex = e.NewPageIndex;
        Bind();  //调用自定义方法Bind()
    }
}