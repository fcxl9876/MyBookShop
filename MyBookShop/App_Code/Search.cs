using System;
using System.Collections.Generic;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Web.Services;

/// <summary>
/// Search 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
[System.Web.Script.Services.ScriptService]
public class Search : System.Web.Services.WebService
{

    public Search()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetStrings(string prefixText, int count)
    {
        MyBookShopDataContext db = new MyBookShopDataContext();
        //模糊查找与关连文本框中输入值匹配的商品
        var books = from b in db.Book
                       where SqlMethods.Like(b.Name, "%" + prefixText.Trim() + "%")
                       select b;
        //将查找到商品的商品名填充到列表类中
        List<String> list = new List<String>(count);
        foreach (var book in books)
        {
            list.Add(book.Name);
        }
        return list.ToArray();
    }

}
