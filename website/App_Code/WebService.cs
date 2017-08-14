using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[ScriptService]
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

    }

    CData dataAccess = new CData();

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getAllBooks()
    {
        List<Book> book_collection = dataAccess.getAllBooks();
        return getSerializedString(book_collection);



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getSomeBooks(string user_id)
    {
        int book_count = 5;
        List<Book> book_collection = dataAccess.getSomeBooks(book_count);
        return getSerializedString(book_collection);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void addToCart(string user_id, string book_id)
    {
        dataAccess.addToCart(user_id, Int32.Parse(book_id));
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void addToWishlist(string user_id, string book_id)
    {
        dataAccess.addToWishlist(user_id, Int32.Parse(book_id));
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void removeBookFromCart(string user_id, string auto_id)
    {
        dataAccess.removeFromCart(user_id, Int32.Parse(auto_id));
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void removeBookFromWishlist(string user_id, string auto_id)
    {
        dataAccess.removeFromWishlist(user_id, Int32.Parse(auto_id));
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getAllCart(string user_id)
    {
        List<Cart> cart_collection = dataAccess.getCartCollection(user_id);
        return getSerializedString(cart_collection);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public void addWishlistToCart(string user_id, string auto_id)
    {
        Wishlist w = dataAccess.getWishlist(Int32.Parse(auto_id));
        w.status = false;
        dataAccess.updateWishlist(w);
        addToCart(user_id, w.book_id.ToString());
    }
    public static string getSerializedString(object obj)
    {
        return JsonConvert.SerializeObject(obj, Formatting.Indented,new JsonSerializerSettings
               {PreserveReferencesHandling = PreserveReferencesHandling.Objects});
    }
}
