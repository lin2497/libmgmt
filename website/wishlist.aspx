<%@ Page Title="" Language="C#" MasterPageFile="~/head_master.master" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%
        CData db = new CData();
        string section_default_id = "recommended_section";
        List<Wishlist> wishlist_collection = db.getWishlistCollection(User.Identity.GetUserId());
    %>
    <div class="main">
        <div class="container">
            <%
                if (wishlist_collection.Count > 0)
                {
            %>
            <div class="col-md-12 col-sm-12">
                <h1>Wishlist</h1>
                <div class="goods-page">
                    <div class="goods-data clearfix">
                        <div class="table-wrapper-responsive">
                            <table summary="Shopping cart">
                                <tr>
                                    <th class="goods-page-image">Image</th>
                                    <th class="goods-page-description">Description</th>
                                    <th class="goods-page-ref-no">Publish date</th>
                                    <th class="goods-page-quantity">ISBN</th>
                                </tr>
                                <%

                                    for (int i = 0; i < wishlist_collection.Count; i++)
                                    {
                                        Book book = db.getBook((int)wishlist_collection[i].book_id);
                                        string section_id = section_default_id + wishlist_collection[i].auto_id;
                                %>
                                <tr id="<%= section_id%>">
                                    <td class="goods-page-image">
                                        <a href="javascript:;">
                                            <img src="/img/<%= book.image_path%>" alt="Berry Lace Dress"></a>
                                    </td>
                                    <td class="goods-page-description">
                                        <h3><a href="javascript:;"><%=book.title %></a></h3>
                                        <p><strong><%= book.author%></p>
                                    </td>
                                    <td class="goods-page-ref-no"><%= book.publish_date%>
                                    </td>
                                    <td class="goods-page-price">
                                        <p><%=book.isbn %></p>
                                    </td>
                                    <td class="del-goods-col">
                                        <a id="book_holder_<%=wishlist_collection[i].auto_id %>"></a>
                                        <a class="del-goods" id="book_del_<%=wishlist_collection[i].auto_id %>" href="javascript:removeBookFromWishlist(<%=wishlist_collection[i].auto_id %>);">&nbsp;</a>
                                        <a class="add-goods" id="book_add_<%=wishlist_collection[i].auto_id %>" href="javascript:addWishlistToCart(<%=wishlist_collection[i].auto_id %>);">&nbsp;</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
                            <div class="default-form" role="form">
                                <a href="recommendation.aspx" class="btn btn-default" value="Continue shopping"><i class="fa fa-shopping-cart"></i></a>
                                <a href="checkout.aspx" class="btn btn-primary" value="Checkout"><i class="fa fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
                else
                {
            %>
            <div class="col-md-12 col-sm-12">
                <h1>Shopping cart</h1>
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <p>Your shopping cart is empty!</p>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <input type="hidden" id="hid_user_id" value="<%=User.Identity.GetUserId()%>" />

    <script>
        function removeBookFromWishlist(auto_id) {
            var user_id = $('#hid_user_id').val();
            var control_name = "<%=section_default_id%>";
            if (user_id != null && user_id != "") {
                var parameters = "{'user_id':'" + user_id + "','auto_id':'" + auto_id + "'}";
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/removeBookFromWishlist",
                    data: parameters,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $("#" + control_name + auto_id).remove();
                    },
                    error: function (data) {
                        alert("An error has occurred.");
                    }
                });
            }
            else {
                window.location.replace("/Account/login.aspx");
            }
        }

        function addWishlistToCart(auto_id) {
            var user_id = $('#hid_user_id').val();
            var control_name = "<%=section_default_id%>";
            if (user_id != null && user_id != "") {
                var parameters = "{'user_id':'" + user_id + "','auto_id':'" + auto_id + "'}";
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/addWishlistToCart",
                    data: parameters,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $("#" + "book_add_" + auto_id).remove();
                        $("#" + "book_del_" + auto_id).remove();
                        $("#" + "book_holder_" + auto_id).html('Item added to cart!');

                    },
                    error: function (data) {
                        alert("An error has occurred");
                    }
                });
            }
            else {
                window.location.replace("/Account/login.aspx");
            }
        }
    </script>
</asp:Content>

