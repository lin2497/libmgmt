<%@ Page Title="" Language="C#" MasterPageFile="~/head_master.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <%
            CData db = new CData();
            string section_default_id = "recommended_section";
            List<Cart> cart_collection = db.getCartCollection(User.Identity.GetUserId());
        %>
        <div class="container">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <h1>Checkout</h1>
                <%if (cart_collection.Count != 0)
                    {
                %>
                <!-- BEGIN CHECKOUT PAGE -->
                <div class="panel-group checkout-page accordion scrollable" id="checkout-page">
                    <!-- BEGIN SHIPPING ADDRESS -->
                    <div id="shipping-address" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#shipping-address-content" class="accordion-toggle">Step 1: Personal Information Confirm
                                </a>
                            </h2>
                        </div>
                        <div id="checkout" class="panel panel-default">
                            <div class="panel-body row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label for="first-name">E-Mail <span class="require">*</span></label>
                                        <div>
                                            <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" TextMode="Email" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="first-name">First Name <span class="require">*</span></label>
                                        <div>
                                            <asp:TextBox runat="server" ID="txt_first_name" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="last-name">Last Name <span class="require">*</span></label>
                                        <div>
                                            <asp:TextBox runat="server" ID="txt_last_name" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="telephone">Telephone </label>
                                        <div>
                                            <asp:TextBox ID="txt_tel" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="fax">Fax</label>
                                        <div>
                                            <asp:TextBox ID="txt_fax" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="company">Company</label>
                                        <div>
                                            <asp:TextBox ID="txt_company" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Country</label>
                                        <asp:DropDownList ID="drop_country" runat="server" CssClass="form-control">
                                            <asp:ListItem>Afghanistan</asp:ListItem>
                                            <asp:ListItem>Albania</asp:ListItem>
                                            <asp:ListItem>Algeria</asp:ListItem>
                                            <asp:ListItem>American Samoa</asp:ListItem>
                                            <asp:ListItem>Andorra</asp:ListItem>
                                            <asp:ListItem>Angola</asp:ListItem>
                                            <asp:ListItem>Anguilla</asp:ListItem>
                                            <asp:ListItem>Antarctica</asp:ListItem>
                                            <asp:ListItem>Antigua and Barbuda</asp:ListItem>
                                            <asp:ListItem>Argentina</asp:ListItem>
                                            <asp:ListItem>Armenia</asp:ListItem>
                                            <asp:ListItem>Aruba</asp:ListItem>
                                            <asp:ListItem>Australia</asp:ListItem>
                                            <asp:ListItem>Austria</asp:ListItem>
                                            <asp:ListItem>Azerbaijan</asp:ListItem>
                                            <asp:ListItem>Bahamas</asp:ListItem>
                                            <asp:ListItem>Bahrain</asp:ListItem>
                                            <asp:ListItem>Bangladesh</asp:ListItem>
                                            <asp:ListItem>Barbados</asp:ListItem>
                                            <asp:ListItem>Belarus</asp:ListItem>
                                            <asp:ListItem>Belgium</asp:ListItem>
                                            <asp:ListItem>Belize</asp:ListItem>
                                            <asp:ListItem>Benin</asp:ListItem>
                                            <asp:ListItem>Bermuda</asp:ListItem>
                                            <asp:ListItem>Bhutan</asp:ListItem>
                                            <asp:ListItem>Bolivia</asp:ListItem>
                                            <asp:ListItem>Bosnia and Herzegovina</asp:ListItem>
                                            <asp:ListItem>Botswana</asp:ListItem>
                                            <asp:ListItem>Brazil</asp:ListItem>
                                            <asp:ListItem>Brunei Darussalam</asp:ListItem>
                                            <asp:ListItem>Bulgaria</asp:ListItem>
                                            <asp:ListItem>Burkina Faso</asp:ListItem>
                                            <asp:ListItem>Burundi</asp:ListItem>
                                            <asp:ListItem>Cambodia</asp:ListItem>
                                            <asp:ListItem>Cameroon</asp:ListItem>
                                            <asp:ListItem>Canada</asp:ListItem>
                                            <asp:ListItem>Cape Verde</asp:ListItem>
                                            <asp:ListItem>Cayman Islands</asp:ListItem>
                                            <asp:ListItem>Central African Republic</asp:ListItem>
                                            <asp:ListItem>Chad</asp:ListItem>
                                            <asp:ListItem>Chile</asp:ListItem>
                                            <asp:ListItem>China</asp:ListItem>
                                            <asp:ListItem>Christmas Island</asp:ListItem>
                                            <asp:ListItem>Cocos (Keeling) Islands</asp:ListItem>
                                            <asp:ListItem>Colombia</asp:ListItem>
                                            <asp:ListItem>Comoros</asp:ListItem>
                                            <asp:ListItem>Democratic Republic of the Congo (Kinshasa)</asp:ListItem>
                                            <asp:ListItem>Congo, Republic of (Brazzaville)</asp:ListItem>
                                            <asp:ListItem>Cook Islands</asp:ListItem>
                                            <asp:ListItem>Costa Rica</asp:ListItem>
                                            <asp:ListItem>Ivory Coast</asp:ListItem>
                                            <asp:ListItem>Croatia</asp:ListItem>
                                            <asp:ListItem>Cuba</asp:ListItem>
                                            <asp:ListItem>Cyprus</asp:ListItem>
                                            <asp:ListItem>Czech Republic</asp:ListItem>
                                            <asp:ListItem>Denmark</asp:ListItem>
                                            <asp:ListItem>Djibouti</asp:ListItem>
                                            <asp:ListItem>Dominica</asp:ListItem>
                                            <asp:ListItem>Dominican Republic</asp:ListItem>
                                            <asp:ListItem>East Timor (Timor-Leste)</asp:ListItem>
                                            <asp:ListItem>Ecuador</asp:ListItem>
                                            <asp:ListItem>Egypt</asp:ListItem>
                                            <asp:ListItem>El Salvador</asp:ListItem>
                                            <asp:ListItem>Equatorial Guinea</asp:ListItem>
                                            <asp:ListItem>Eritrea</asp:ListItem>
                                            <asp:ListItem>Estonia</asp:ListItem>
                                            <asp:ListItem>Ethiopia</asp:ListItem>
                                            <asp:ListItem>Falkland Islands</asp:ListItem>
                                            <asp:ListItem>Faroe Islands</asp:ListItem>
                                            <asp:ListItem>Fiji</asp:ListItem>
                                            <asp:ListItem>Finland</asp:ListItem>
                                            <asp:ListItem>France</asp:ListItem>
                                            <asp:ListItem>French Guiana</asp:ListItem>
                                            <asp:ListItem>French Polynesia</asp:ListItem>
                                            <asp:ListItem>French Southern Territories</asp:ListItem>
                                            <asp:ListItem>Gabon</asp:ListItem>
                                            <asp:ListItem>Gambia</asp:ListItem>
                                            <asp:ListItem>Georgia</asp:ListItem>
                                            <asp:ListItem>Germany</asp:ListItem>
                                            <asp:ListItem>Ghana</asp:ListItem>
                                            <asp:ListItem>Gibraltar</asp:ListItem>
                                            <asp:ListItem>Great Britain</asp:ListItem>
                                            <asp:ListItem>Greece</asp:ListItem>
                                            <asp:ListItem>Greenland</asp:ListItem>
                                            <asp:ListItem>Grenada</asp:ListItem>
                                            <asp:ListItem>Guadeloupe</asp:ListItem>
                                            <asp:ListItem>Guam</asp:ListItem>
                                            <asp:ListItem>Guatemala</asp:ListItem>
                                            <asp:ListItem>Guinea</asp:ListItem>
                                            <asp:ListItem>Guinea-Bissau</asp:ListItem>
                                            <asp:ListItem>Guyana</asp:ListItem>
                                            <asp:ListItem>Haiti</asp:ListItem>
                                            <asp:ListItem>Holy See</asp:ListItem>
                                            <asp:ListItem>Honduras</asp:ListItem>
                                            <asp:ListItem>Hong Kong</asp:ListItem>
                                            <asp:ListItem>Hungary</asp:ListItem>
                                            <asp:ListItem>Iceland</asp:ListItem>
                                            <asp:ListItem>India</asp:ListItem>
                                            <asp:ListItem>Indonesia</asp:ListItem>
                                            <asp:ListItem>Iran (Islamic Republic of)</asp:ListItem>
                                            <asp:ListItem>Iraq</asp:ListItem>
                                            <asp:ListItem>Ireland</asp:ListItem>
                                            <asp:ListItem>Israel</asp:ListItem>
                                            <asp:ListItem>Italy</asp:ListItem>
                                            <asp:ListItem>Jamaica</asp:ListItem>
                                            <asp:ListItem>Japan</asp:ListItem>
                                            <asp:ListItem>Jordan</asp:ListItem>
                                            <asp:ListItem>Kazakhstan</asp:ListItem>
                                            <asp:ListItem>Kenya</asp:ListItem>
                                            <asp:ListItem>Kiribati</asp:ListItem>
                                            <asp:ListItem>Korea, Democratic People's Rep. (North Korea)</asp:ListItem>
                                            <asp:ListItem>Korea, Republic of (South Korea)</asp:ListItem>
                                            <asp:ListItem>Kosovo</asp:ListItem>
                                            <asp:ListItem>Kuwait</asp:ListItem>
                                            <asp:ListItem>Kyrgyzstan</asp:ListItem>
                                            <asp:ListItem>Lao, People's Democratic Republic</asp:ListItem>
                                            <asp:ListItem>Latvia</asp:ListItem>
                                            <asp:ListItem>Lebanon</asp:ListItem>
                                            <asp:ListItem>Lesotho</asp:ListItem>
                                            <asp:ListItem>Liberia</asp:ListItem>
                                            <asp:ListItem>Libya</asp:ListItem>
                                            <asp:ListItem>Liechtenstein</asp:ListItem>
                                            <asp:ListItem>Lithuania</asp:ListItem>
                                            <asp:ListItem>Luxembourg</asp:ListItem>
                                            <asp:ListItem>Macau</asp:ListItem>
                                            <asp:ListItem>Macedonia, Rep. of</asp:ListItem>
                                            <asp:ListItem>Madagascar</asp:ListItem>
                                            <asp:ListItem>Malawi</asp:ListItem>
                                            <asp:ListItem>Malaysia</asp:ListItem>
                                            <asp:ListItem>Maldives</asp:ListItem>
                                            <asp:ListItem>Mali</asp:ListItem>
                                            <asp:ListItem>Malta</asp:ListItem>
                                            <asp:ListItem>Marshall Islands</asp:ListItem>
                                            <asp:ListItem>Martinique</asp:ListItem>
                                            <asp:ListItem>Mauritania</asp:ListItem>
                                            <asp:ListItem>Mauritius</asp:ListItem>
                                            <asp:ListItem>Mayotte</asp:ListItem>
                                            <asp:ListItem>Mexico</asp:ListItem>
                                            <asp:ListItem>Micronesia, Federal States of</asp:ListItem>
                                            <asp:ListItem>Moldova, Republic of</asp:ListItem>
                                            <asp:ListItem>Monaco</asp:ListItem>
                                            <asp:ListItem>Mongolia</asp:ListItem>
                                            <asp:ListItem>Montenegro</asp:ListItem>
                                            <asp:ListItem>Montserrat</asp:ListItem>
                                            <asp:ListItem>Morocco</asp:ListItem>
                                            <asp:ListItem>Mozambique</asp:ListItem>
                                            <asp:ListItem>Myanmar, Burma</asp:ListItem>
                                            <asp:ListItem>Namibia</asp:ListItem>
                                            <asp:ListItem>Nauru</asp:ListItem>
                                            <asp:ListItem>Nepal</asp:ListItem>
                                            <asp:ListItem>Netherlands</asp:ListItem>
                                            <asp:ListItem>Netherlands Antilles</asp:ListItem>
                                            <asp:ListItem>New Caledonia</asp:ListItem>
                                            <asp:ListItem>New Zealand</asp:ListItem>
                                            <asp:ListItem>Nicaragua</asp:ListItem>
                                            <asp:ListItem>Niger</asp:ListItem>
                                            <asp:ListItem>Nigeria</asp:ListItem>
                                            <asp:ListItem>Niue</asp:ListItem>
                                            <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                                            <asp:ListItem>Norway</asp:ListItem>
                                            <asp:ListItem>Oman</asp:ListItem>
                                            <asp:ListItem>Pakistan</asp:ListItem>
                                            <asp:ListItem>Palau</asp:ListItem>
                                            <asp:ListItem>Palestinian territories</asp:ListItem>
                                            <asp:ListItem>Panama</asp:ListItem>
                                            <asp:ListItem>Papua New Guinea</asp:ListItem>
                                            <asp:ListItem>Paraguay</asp:ListItem>
                                            <asp:ListItem>Peru</asp:ListItem>
                                            <asp:ListItem>Philippines</asp:ListItem>
                                            <asp:ListItem>Pitcairn Island</asp:ListItem>
                                            <asp:ListItem>Poland</asp:ListItem>
                                            <asp:ListItem>Portugal</asp:ListItem>
                                            <asp:ListItem>Puerto Rico</asp:ListItem>
                                            <asp:ListItem>Qatar</asp:ListItem>
                                            <asp:ListItem>Reunion Island</asp:ListItem>
                                            <asp:ListItem>Romania</asp:ListItem>
                                            <asp:ListItem>Russian Federation</asp:ListItem>
                                            <asp:ListItem>Rwanda</asp:ListItem>
                                            <asp:ListItem>Saint Kitts and Nevis</asp:ListItem>
                                            <asp:ListItem>Saint Lucia</asp:ListItem>
                                            <asp:ListItem>Saint Vincent and the Grenadines</asp:ListItem>
                                            <asp:ListItem>Samoa</asp:ListItem>
                                            <asp:ListItem>San Marino</asp:ListItem>
                                            <asp:ListItem>Sao Tome and Principe</asp:ListItem>
                                            <asp:ListItem>Saudi Arabia</asp:ListItem>
                                            <asp:ListItem>Senegal</asp:ListItem>
                                            <asp:ListItem>Serbia</asp:ListItem>
                                            <asp:ListItem>Seychelles</asp:ListItem>
                                            <asp:ListItem>Sierra Leone</asp:ListItem>
                                            <asp:ListItem>Singapore</asp:ListItem>
                                            <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                                            <asp:ListItem>Slovenia</asp:ListItem>
                                            <asp:ListItem>Solomon Islands</asp:ListItem>
                                            <asp:ListItem>Somalia</asp:ListItem>
                                            <asp:ListItem>South Africa</asp:ListItem>
                                            <asp:ListItem>South Sudan</asp:ListItem>
                                            <asp:ListItem>Spain</asp:ListItem>
                                            <asp:ListItem>Sri Lanka</asp:ListItem>
                                            <asp:ListItem>Sudan</asp:ListItem>
                                            <asp:ListItem>Suriname</asp:ListItem>
                                            <asp:ListItem>Swaziland</asp:ListItem>
                                            <asp:ListItem>Sweden</asp:ListItem>
                                            <asp:ListItem>Switzerland</asp:ListItem>
                                            <asp:ListItem>Syria, Syrian Arab Republic</asp:ListItem>
                                            <asp:ListItem>Taiwan (Republic of China)</asp:ListItem>
                                            <asp:ListItem>Tajikistan</asp:ListItem>
                                            <asp:ListItem>Tanzania; officially the United Republic of Tanzania</asp:ListItem>
                                            <asp:ListItem>Thailand</asp:ListItem>
                                            <asp:ListItem>Tibet</asp:ListItem>
                                            <asp:ListItem>Timor-Leste (East Timor)</asp:ListItem>
                                            <asp:ListItem>Togo</asp:ListItem>
                                            <asp:ListItem>Tokelau</asp:ListItem>
                                            <asp:ListItem>Tonga</asp:ListItem>
                                            <asp:ListItem>Trinidad and Tobago</asp:ListItem>
                                            <asp:ListItem>Tunisia</asp:ListItem>
                                            <asp:ListItem>Turkey</asp:ListItem>
                                            <asp:ListItem>Turkmenistan</asp:ListItem>
                                            <asp:ListItem>Turks and Caicos Islands</asp:ListItem>
                                            <asp:ListItem>Tuvalu</asp:ListItem>
                                            <asp:ListItem>Uganda</asp:ListItem>
                                            <asp:ListItem>Ukraine</asp:ListItem>
                                            <asp:ListItem>United Arab Emirates</asp:ListItem>
                                            <asp:ListItem>United Kingdom</asp:ListItem>
                                            <asp:ListItem>United States</asp:ListItem>
                                            <asp:ListItem>Uruguay</asp:ListItem>
                                            <asp:ListItem>Uzbekistan</asp:ListItem>
                                            <asp:ListItem>Vanuatu</asp:ListItem>
                                            <asp:ListItem>Vatican City State (Holy See)</asp:ListItem>
                                            <asp:ListItem>Venezuela</asp:ListItem>
                                            <asp:ListItem>Vietnam</asp:ListItem>
                                            <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                                            <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                                            <asp:ListItem>Wallis and Futuna Islands</asp:ListItem>
                                            <asp:ListItem>Western Sahara</asp:ListItem>
                                            <asp:ListItem>Yemen</asp:ListItem>
                                            <asp:ListItem>Zambia</asp:ListItem>
                                            <asp:ListItem>Zimbabwe</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="post">Post Code</label>
                                        <div>
                                            <asp:TextBox ID="txt_post" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">City</label>
                                        <div>
                                            <asp:TextBox ID="txt_city" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="address1">Address 1</label>
                                        <div>
                                            <asp:TextBox ID="txt_add1" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="address2">Address 2</label>
                                        <div>
                                            <asp:TextBox ID="txt_add2" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-primary  pull-right" type="button" id="button-shipping-address" data-toggle="collapse" data-parent="#checkout-page" data-target="#confirm-content">Continue</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END SHIPPING ADDRESS -->
                    <!-- BEGIN CONFIRM -->
                    <div id="confirm" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#confirm-content" class="accordion-toggle">Step 2: Confirm Order
                                </a>
                            </h2>
                        </div>
                        <div id="confirm-content" class="panel-collapse collapse">
                            <div class="panel-body row">
                                <div class="col-md-12 clearfix">
                                    <table summary="Shopping cart">
                                        <tr>
                                            <th class="goods-page-image">Image</th>
                                            <th class="goods-page-description">Description</th>
                                            <th class="goods-page-ref-no">Publish date</th>
                                            <th class="goods-page-quantity">ISBN</th>
                                        </tr>
                                        <%
                                            for (int i = 0; i < cart_collection.Count; i++)
                                            {
                                                Book book = db.getBook((int)cart_collection[i].book_id);
                                                string section_id = section_default_id + cart_collection[i].auto_id;
                                        %>
                                        <tr id="<%= section_id%>">
                                            <td class="goods-page-image">
                                                <a href="javascript:;">
                                                    <img src="/img/<%= book.image_path%>" alt="Berry Lace Dress"></a>
                                            </td>
                                            <td class="goods-page-description">
                                                <h3><a href="javascript:;"><%=book.title %></a></h3>
                                                <p><strong><%= book.author%></strong></p>
                                            </td>
                                            <td class="goods-page-ref-no"><%= book.publish_date%>
                                            </td>
                                            <td class="goods-page-price">
                                                <p><%=book.isbn %></p>
                                            </td>
                                            <td class="del-goods-col">
                                                <a class="del-goods" href="javascript:removeBookFromCart(<%=cart_collection[i].auto_id %>);">&nbsp;</a>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                    <div class="clearfix"></div>
                                    <asp:Button ID="btn_confirm_order" runat="server" Text="Confirm Order" CssClass="btn btn-primary pull-right" OnClick="btn_confirm_order_Click" />
                                    <button type="button" onclick="javascript:window.location.href='/explore.aspx';" class="btn btn-default pull-right margin-right-20">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END CONFIRM -->
                </div>
                <!-- END CHECKOUT PAGE -->
                <%
                    }
                    else
                    {
                %>
                <div class="col-md-12 col-sm-12">
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
            <!-- END CONTENT -->
        </div>
    </div>
    <input type="hidden" id="hid_user_id" value="<%=User.Identity.GetUserId()%>" />

    <script>
        function removeBookFromCart(auto_id) {
            var user_id = $('#hid_user_id').val();
            if (user_id != null && user_id != "") {
                var control_name = "<%=section_default_id%>";
                $("#" + control_name + auto_id).remove();
                var parameters = "{'user_id':'" + user_id + "','auto_id':'" + auto_id + "'}";
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/removeBookFromCart",
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
        }
    </script>
</asp:Content>

