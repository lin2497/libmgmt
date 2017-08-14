using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class homepage : System.Web.UI.Page
{
    CData db = new CData();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public List<Book> getAllBooks()
    {
        return db.getAllBooks();
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
}