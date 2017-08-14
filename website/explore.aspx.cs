using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class explore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    CData db = new CData();
    public List<Book> getAllBooks()
    {
        List<Book> book_collection = new List<Book>();
        string keyword = getKeyWord();

        if (!String.IsNullOrEmpty(keyword))
            book_collection = db.getBookByCondition(keyword);
        else
            book_collection = db.getAllBooks();

        return book_collection;
    }
    public List<Book> getBooks(List<Book> book_collection, int row)
    {
        List<Book> row_books = new List<Book>();
        for (int i = 0; i < 5; i++)
        {
            int current_index = row * 5 + i;
            if (current_index < book_collection.Count)
                row_books.Add(book_collection[current_index]);
        }
        return row_books;
    }

    public string getKeyWord()
    {
        if (Request.QueryString["keyword"] != null)
        {
            return Request.QueryString["keyword"].ToString();
        }
        return "";
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        Response.Redirect("/explore.aspx?keyword=" + HttpUtility.UrlEncode(txt_keyword.Value));
    }
}