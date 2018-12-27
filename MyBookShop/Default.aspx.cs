using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvBook.PageSize = int.Parse(ddlPageSize.SelectedValue);
        gvBook.DataBind();
    }

    protected void gvBook_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        lblMsg.Text = "当前页为第" + (gvBook.PageIndex + 1).ToString() + "页，共有" + (gvBook.PageCount).ToString() + "页";
    }
}