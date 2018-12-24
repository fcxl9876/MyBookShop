using System;
using System.Linq;

public partial class Category : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        //查询分类号、分类名、该分类包含的商品
        var results = from c in db.Category
                      join b in db.Book on c.CategoryId equals b.CategoryId
                      into book
                      select new
                      {
                          c.CategoryId,
                          c.Name,
                          BookCount = book.Count()
                      };
        gvCategory.DataSource = results;
        gvCategory.DataBind();
    }
}