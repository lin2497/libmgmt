<%@ Page Title="" Language="C#" MasterPageFile="~/head_master.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="container">
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <h1>Contact us</h1>
                <div class="content-page">
                    <h2>Contact Form</h2>
                    <p>Leave us a message so we can improve our service better.</p>
                    <!-- BEGIN FORM-->
                    <asp:Panel ID="error_panel" runat="server" Visible="false">
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            Wrong validation code!
                        </div>
                    </asp:Panel>
                    <div class="default-form" role="form">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="txt_name" runat="server">
                        </div>
                        <div class="form-group">
                            <label for="email">Email <span class="require">*</span></label>
                            <input type="text" class="form-control" id="txt_email" runat="server">
                        </div>
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea class="form-control" rows="8" id="txt_message" runat="server"></textarea>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                            runat="server" ForeColor="Red" Display="Dynamic" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Email validation is required." ControlToValidate="txt_email"
                            runat="server" ForeColor="Red" Display="Dynamic" />
                        <br />
                        <div id="dvCaptcha">
                        </div>
                        <div class="padding-top-20">
                            <asp:Button ID="btnSubmit" Text="Submit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                    <!-- END FORM-->
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
        <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
        <br />
    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer></script>
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
                'callback': function (response) {
                    $.ajax({
                        type: "POST",
                        url: "contact_us.aspx/VerifyCaptcha",
                        data: "{response: '" + response + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var response = grecaptcha.getResponse();
                            if (response.length != 0) {
                                $("[id*=txtCaptcha]").val(response);
                                $("[id*=rfvCaptcha]").hide();
                            } else {
                                $("[id*=txtCaptcha]").val("");
                                $("[id*=rfvCaptcha]").show();
                                $("[id*=rfvCaptcha]").html("RECaptcha error. " + "Captcha did not pass");
                            }
                        }
                    });
                }
            });
        };
    </script>
</asp:Content>

