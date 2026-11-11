<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Database_Connectivity.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shoes Store Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Shoes Store Login</h1>
                <table border="2">
                    <tr>
                        <td>Email</td>
                        <td><asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>Password</td>
                        <td><asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="login_btn" runat="server" Text="Login Here" OnClick="login_btn_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/insert.aspx">New user? Register here</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>