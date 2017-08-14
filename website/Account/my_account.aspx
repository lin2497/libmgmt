<%@ Page Title="" Language="C#" MasterPageFile="~/head_master.master" AutoEventWireup="true" CodeFile="my_account.aspx.cs" Inherits="my_account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="container">
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <h1>My Account</h1>
                <div class="content-page">
                    <h3>Account Details</h3>
                    <ul>
                        <li><a href="/Account/personal_information.aspx">Edit your account information</a></li>
                        <li><a href="/Account/reset_password_request.aspx">Change your password</a></li>
                    </ul>
                    <hr>

                    <h3>My Books</h3>
                    <ul>
                        <li><a href="/cart.aspx">View your cart</a></li>
                        <li><a href="/wishlist.aspx">Modify your wishlist</a></li>
                    </ul>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
    </div>
</asp:Content>

