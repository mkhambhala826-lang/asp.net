<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Products.aspx.cs" Inherits="Database_Connectivity.Add_Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Shoes</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Add Shoes</h1>
                <p>

                    <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                </p>

                <asp:HyperLink ID="ShowCompany" runat="server" NavigateUrl="Show_Company.aspx">
                    Show Shoe Brands
                </asp:HyperLink>
                &nbsp;|&nbsp;
                <a href="Show_Products.aspx">Show Shoes</a>

                <table border="2">




                    <tr>
                        <td>Shoe Brand</td>
                        <td>
                            <asp:DropDownList ID="drpcompid" runat="server" AutoPostBack="True">
                                <asp:ListItem>---Select Brand---</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>Shoe Model / Name</td>
                        <td>
                            <asp:TextBox ID="txtmodel" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Shoe Description
                        </td>
                        <td>
                            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Shoe Size / Weight</td>
                        <td>
                            <asp:TextBox ID="txtweight" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Shoe Material / Type</td>
                        <td>
                            <asp:TextBox ID="txtconfig" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Shoe Image</td>
                        <td>
                            <asp:FileUpload ID="imgUpload" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td>Shoe Price</td>
                        <td>
                            <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAdd" runat="server"
                                Text="Add Shoe"
                                OnClick="btnAdd_Click" />
                        </td>
                    </tr>

                </table>
            </center>
        </div>
    </form>
</body>
</html>
