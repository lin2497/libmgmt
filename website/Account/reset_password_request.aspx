<%@ Page Title="" Language="C#" MasterPageFile="~/head_master.master" AutoEventWireup="true" CodeFile="reset_password_request.aspx.cs" Inherits="reset_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <!-- BEGIN CONTENT -->
        <div class="col-md-12 col-sm-7">
            <h1>Reset Password</h1>
            <div class="content-form-page">
                <div role="form" class="form-horizontal form-without-legend">
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
                        <p class="text-info">
                            Please check your email to reset your password.
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="loginForm" Visible="true">
                        <div role="form" class="form-horizontal form-without-legend">
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Email</label>
                                <div class="col-lg-8">
                                    <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_email"
                                        CssClass="text-danger" ErrorMessage="The E-Mail field is required." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-md-offset-2 padding-left-0 padding-top-20">
                                    <asp:Button ID="btn_reset" runat="server" Text="Send Reset Email" CssClass="btn btn-primary" OnClick="btn_reset_Click" />
                                </div>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>

</asp:Content>

