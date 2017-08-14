<%@ Page Title="" Language="C#" MasterPageFile="~/head_master.master" AutoEventWireup="true" CodeFile="explore.aspx.cs" Inherits="explore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main" ng-app="app" ng-controller="ctrl">
        <div class="container">
            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row margin-bottom-40 ">
                <!-- BEGIN CONTENT -->
                <h1>Explore</h1>
                <div class="content-search margin-bottom-20">
                    <div class="row">
                        <div class="col-md-6">
                            <%if (getKeyWord().Length > 0)
                                {
                            %>
                            <h1>Search result for <em><%=getKeyWord() %></em></h1>
                            <%
                                }
                            %>
                        </div>
                        <div class="col-md-6">
                            <div action="#">
                                <div class="input-group">
                                    <input id="txt_keyword" type="text" placeholder="Search again" class="form-control" runat="server">
                                    <span class="input-group-btn">
                                        <asp:Button ID="btn_search" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btn_search_Click" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <%
                        string section_default_id = "recommended_section";
                        List<Book> all_book_collection = getAllBooks();
                        int rows = all_book_collection.Count / 5;
                        for (int r = 0; r <= rows; r++)
                        {
                    %>
                    <div class="owl-carousel owl-carousel5">
                        <%
                            List<Book> book_collection = getBooks(all_book_collection, r);
                            for (int i = 0; i < book_collection.Count; i++)
                            {
                                string section_id = section_default_id + book_collection[i].auto_id;
                        %>
                        <div>
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img src="/img/<%=book_collection[i].image_path%>" class="img-responsive" alt="Berry Lace Dress">
                                    <div>
                                        <a href="/img/<%=book_collection[i].image_path%>" class="btn btn-default fancybox-button">Zoom</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" ng-click="setSelectedBook(<%=book_collection[i].auto_id %>);">View</a>
                                    </div>
                                </div>
                                <div class="pi-price"><%=book_collection[i].title%></div>
                                <h3><%=book_collection[i].author%></h3>
                                <h3><%=book_collection[i].publish_date%></h3>
                                <h3><%=book_collection[i].isbn%></h3>
                                <a id="<%=section_id%>" href="javascript:addToCart('<%=book_collection[i].auto_id %>');" class="btn btn-default add2cart">Add to cart</a>
                                <%
                                    if ((bool)book_collection[i].isNew)
                                    {
                                %>
                                <div class="sticker sticker-new"></div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>
                    <!-- END CONTENT -->
                </div>
                <!-- END SIDEBAR & CONTENT -->
            </div>
        </div>
        <%--ss logo set--%>
        <!-- BEGIN BRANDS -->
        <!-- BEGIN STEPS -->
        <div class="steps-block steps-block-red">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 steps-block-col">
                        <i class="fa fa-check-square-o"></i>
                        <div>
                            <h2>Quick</h2>
                            <em>Order your book online!</em>
                        </div>
                    </div>
                    <div class="col-md-4 steps-block-col">
                        <i class="fa fa-check-square-o "></i>
                        <div>
                            <h2>Free</h2>
                            <em>No extra fee collected!</em>
                        </div>
                        <span>&nbsp;</span>
                    </div>
                    <div class="col-md-4 steps-block-col">
                        <i class="fa fa-book fa-book"></i>
                        <div>
                            <h2>New</h2>
                            <em>New books recommended!</em>
                        </div>
                        <span>&nbsp;</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- BEGIN fast view of a product -->
        <div id="product-pop-up" style="display: none; width: 700px;">
            <div class="product-page product-pop-up">
                <div class="row" ng-model="selected_book">
                    <div class="col-md-6 col-sm-6 col-xs-3">
                        <div class="product-main-image">
                            <img src="/img/{{selected_book.image_path}}" alt="Cool green dress with red bell" class="img-responsive">
                            <div ng-show="selected_book.isNew" class="sticker sticker-new"></div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-9">
                        <div class="price-availability-block clearfix">
                            <div class="price">
                                <h2><strong>{{selected_book.title}}</strong></h2>
                            </div>
                        </div>
                        <h3>{{selected_book.author}}</h3>
                        <h4>Pulication date: {{selected_book.publish_date}}</h4>
                        <div class="description">
                            <p>Something about the book...</p>
                        </div>
                        <div class="product-page-cart">
                            <a class="btn btn-primary" id="pop_up_btn" ng-click="addToCart(selected_book.auto_id);">Add to cart</a>
                            <a class="btn btn-default" id="pop_up_btn_wishlist" ng-click="addToWishlist(selected_book.auto_id);">Add to wishlist</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END fast view of a product -->
        <input type="hidden" id="hid_user_id" value="<%=User.Identity.GetUserId()%>" />
        <!-- END STEPS -->
        <script>
            function addToCart(book_id) {
                var user_id = $('#hid_user_id').val();
                if (user_id != null && user_id != "") {
                    var control_name = "<%=section_default_id%>";
                    $("#" + control_name + book_id).html("Added to cart");
                    $("#" + control_name + book_id).attr("href", "javascript:;");
                    var parameters = "{'user_id':'" + user_id + "','book_id':'" + book_id + "'}";
                    $.ajax({
                        type: "POST",
                        url: "WebService.asmx/addToCart",
                        data: parameters,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                        },
                        error: function (data) {
                            alert("An error has occurred.");
                        }
                    });
                }
                else {
                    window.location.replace("/Account/login.aspx");
                }
            };


            var app = angular.module('app', []);
            app.controller('ctrl', function ($scope, $http, $filter) {
                var user_id = $('#hid_user_id').val();

                $http.post("WebService.asmx/" + "getAllBooks", "")
                .success(function (data) {
                    var display_set = JSON.parse(data.d);
                    $scope.display_set = display_set;
                }).error(function (data) {
                    alert("An error has occurred.");
                });

                $scope.setSelectedBook = function (selected_book_auto_id) {
                    $scope.selected_book = $filter('filter')($scope.display_set, { auto_id: selected_book_auto_id }, true)[0];
                };

                $scope.addToCart = function (book_id) {
                    if (user_id != null && user_id != "") {
                        $("#pop_up_btn").html("Added to cart");
                        $http.post("WebService.asmx/" + "addToCart", "{'user_id':'" + user_id + "','book_id':'" + book_id + "'}")
                        .success(function (data) {
                        }).error(function (data) {
                            alert("An error has occurred.");
                        });
                    }
                    else {
                        window.location.replace("/Account/login.aspx");
                    }
                };

                $scope.addToWishlist = function (book_id) {
                    if (user_id != null && user_id != "") {
                        $("#pop_up_btn_wishlist").html("Added to wishlist");
                        $http.post("WebService.asmx/" + "addToWishlist", "{'user_id':'" + user_id + "','book_id':'" + book_id + "'}")
                        .success(function (data) {
                        }).error(function (data) {
                            alert("An error has occurred.");
                        });
                    }
                    else {
                        window.location.replace("/Account/login.aspx");
                    }
                };
            });
            app.filter('getById', function () {
                return function (input, id) {
                    var i = 0, len = input.length;
                    for (; i < len; i++) {
                        if (+input[i].id == +id) {
                            return input[i];
                        }
                    }
                    return null;
                }
            });
        </script>
    </div>
</asp:Content>

