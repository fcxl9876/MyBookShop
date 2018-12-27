using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class UserControl_BookTree : System.Web.UI.UserControl
{
    MyBookShopDataContext db = new MyBookShopDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindTree();
        }
    }

    /// <summary>
    /// 将所有分类绑定到TreeView1的父节点中
    /// </summary>
    protected void BindTree()
    {
        var categories = from c in db.Category
                         select c;
        foreach (var category in categories)
        {
            TreeNode treeNode = new TreeNode();
            treeNode.Text = category.Name;
            treeNode.Value = category.CategoryId.ToString();
            treeNode.NavigateUrl = "~/BookShow.aspx?CategoryId=" + category.CategoryId.ToString();
            TreeView1.Nodes.Add(treeNode);
            BindTreeChild(treeNode, category.CategoryId);
        }
    }

    /// <summary>
    /// 将指定分类号下的所有图书绑定到子节点中
    /// </summary>
    /// <param name="tn">子节点名</param>
    /// <param name="categoryId">指定分类号</param>
    protected void BindTreeChild(TreeNode tn, int categoryId)
    {
        var books = from b in db.Book
                       where b.Category.CategoryId == categoryId
                       select b;
        foreach (var book in books)
        {
            TreeNode treeNode = new TreeNode();
            treeNode.Text = book.Name;
            treeNode.Value = book.BookId.ToString();
            treeNode.NavigateUrl = "~/BookShow.aspx?ProductId=" + book.BookId.ToString();
            tn.ChildNodes.Add(treeNode);
        }
    }
}
