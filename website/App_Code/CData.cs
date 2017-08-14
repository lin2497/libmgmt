using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CData
/// </summary>
public class CData
{
    libmgmtEntities db = new libmgmtEntities();
    public CData()
    {

    }
    public UserInfo getUserInfoByUserID(string _user_id)
    {
        UserInfo user_info = db.UserInfoes.Where(u => u.user_id.Equals(_user_id)).FirstOrDefault();
        return user_info;
    }
    public UserInfo getUserInfo(int _info_id)
    {
        UserInfo user_info = db.UserInfoes.Where(u => u.auto_id.Equals(_info_id)).FirstOrDefault();
        return user_info;
    }
    public void saveUserInfo(UserInfo info)
    {
        UserInfo previous_info = getUserInfoByUserID(info.user_id);
        if (info != null)
        {
            db.Entry(previous_info).CurrentValues.SetValues(info);
            db.SaveChanges();
        }
    }

    public Book getBook(int _book_id)
    {
        Book book = db.Books.Where(b => b.auto_id.Equals(_book_id)).FirstOrDefault();
        return book;
    }
    
    public List<Book> getSomeBooks(int _book_count)
    {
        List<Book> book_collection = db.Books.Take(_book_count).ToList<Book>();
        return book_collection;
    }

    public List<Book> getNewBooks()
    {
        List<Book> book_collection = db.Books.Where(b => b.isNew == true).ToList<Book>();
        return book_collection;
    }

    public List<Book> getBookByCondition(string keyword)
    {
        List<Book> book_collection = 
            db.Books.Where(b => b.title.Contains(keyword)||
            b.author.Contains(keyword) ||
            b.isbn.Contains(keyword)).ToList<Book>();
        return book_collection;
    }

    public List<Book> getAllBooks()
    {
        List<Book> book_collection = db.Books.ToList<Book>();
        return book_collection;
    }
    public List<Wishlist> getWishlistCollection(string _user_id)
    {
        List<Wishlist> wishlist_collection = db.Wishlists.Where(w => w.user_id.Equals(_user_id) && w.status == true).ToList<Wishlist>();
        return wishlist_collection;
    }
    public List<Cart> getCartCollection(string _user_id)
    {
        List<Cart> cart_colleciton = db.Carts.Where(c => c.user_id.Equals(_user_id) && c.status == true).ToList<Cart>();
        return cart_colleciton;
    }
    public Wishlist getWishlist(int auto_id)
    {
        Wishlist wishlist = db.Wishlists.Where(w => w.auto_id.Equals(auto_id) && w.status == true).FirstOrDefault();
        return wishlist;
    }
    public Cart getCart(int auto_id)
    {
        Cart cart = db.Carts.Where(c => c.auto_id.Equals(auto_id)).FirstOrDefault();
        return cart;
    }

    public void addToWishlist(string _user_id, int _book_id)
    {
        Wishlist w = new Wishlist();
        w.book_id = _book_id;
        w.user_id = _user_id;
        w.status = true;
        db.Wishlists.Add(w);
        db.SaveChanges();
    }
    public void addToCart(string _user_id, int _book_id)
    {
        Cart c = new Cart();
        c.book_id = _book_id;
        c.user_id = _user_id;
        c.status = true;
        db.Carts.Add(c);
        db.SaveChanges();
    }

    public void removeFromWishlist(string user_id, int auto_id)
    {
        Wishlist w = getWishlist(auto_id);
        db.Wishlists.Remove(w);
        db.SaveChanges();
    }
    public void removeFromCart(string _user_id, int auto_id)
    {
        Cart c = getCart(auto_id);
        if (c != null)
        {
            db.Carts.Remove(c);
            db.SaveChanges();
        }
    }
    public void checkoutCart(string user_id, book_order book_order)
    {
        db.book_order.Add(book_order);
        db.SaveChanges();
        int order_id = book_order.auto_id;
        List<Cart> listCart = db.Carts.Where(c => c.user_id == user_id).ToList<Cart>();
        for (int i = 0; i < listCart.Count; i++)
        {
            order_detail detail = new order_detail();
            detail.order_id = order_id;
            detail.book_id = listCart[i].book_id;
            db.order_detail.Add(detail);
            db.SaveChanges();

            listCart[i].status = false;
            updateCart(listCart[i]);
        }
    }
    public void updateWishlist(Wishlist new_wishlist)
    {
        Wishlist original_wishlist = getWishlist(new_wishlist.auto_id);
        if (new_wishlist != null)
        {
            db.Entry(original_wishlist).CurrentValues.SetValues(new_wishlist);
            db.SaveChanges();
        }
    }

    public void updateCart(Cart new_cart)
    {
        Cart original_cart = getCart(new_cart.auto_id);
        if (new_cart != null)
        {
            db.Entry(original_cart).CurrentValues.SetValues(new_cart);
            db.SaveChanges();
        }
    }
}