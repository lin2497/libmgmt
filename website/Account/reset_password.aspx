<%@ Page Title="" Language="C#" MasterPageFile="~/head_master.master" AutoEventWireup="true" CodeFile="reset_password.aspx.cs" Inherits="Account_reset_password_confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="container">
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <h1>Enter your new password</h1>
                <div class="content-form-page">
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="ErrorMessage"/>
                    </p>
                    <asp:PlaceHolder ID="section_reset" runat="server" Visible="false" >
                        <div role="form" class="form-horizontal form-without-legend">
                            <div class="form-group">
                                <label class="col-lg-2 control-label" for="first-name">password<span class="require">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox runat="server" ID="txt_password" TextMode="password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label" for="first-name">Confirm password<span class="require">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox runat="server" ID="Confirmpassword" TextMode="password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Confirmpassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                    <asp:CompareValidator runat="server" ControlToCompare="txt_password" ControlToValidate="Confirmpassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                                    <asp:Button ID="btn_password_renew" runat="server" Text="Reset Password" CssClass="btn btn-primary" OnClick="btn_password_renew_Click" />
                                </div>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

