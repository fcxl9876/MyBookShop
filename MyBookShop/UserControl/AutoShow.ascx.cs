using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class UserControl_AutoShow : System.Web.UI.UserControl
{
    MyBookShopDataContext db = new MyBookShopDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind();  //调用自定义方法
    }
    protected void Bind()
    {
        var books = from b in db.Book
                       select b;
        gvBook.DataSource = books;
        gvBook.DataBind();
    }

    protected void gvBook_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBook.PageIndex = e.NewPageIndex;
        Bind();
        //System.Threading.Thread.Sleep(3000);  //用于感受UpdateProgress控件效果，实际工程中需删除
    }

    protected void tmrAutoShow_Tick(object sender, EventArgs e)
    {
        int newPageIndex = gvBook.PageIndex;
        if (newPageIndex == gvBook.PageCount - 1)
        {
            newPageIndex = 0;
        }
        else
        {
            newPageIndex += 1;
        }
        gvBook.PageIndex = newPageIndex;
    }

    protected void chkAutoShow_CheckedChanged(object sender, EventArgs e)
    {
        tmrAutoShow.Enabled = chkAutoShow.Checked;
    }
}