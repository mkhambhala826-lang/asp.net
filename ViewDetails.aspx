<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Database_Connectivity.ViewDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shoe Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Shoe Details</h1>
                <p>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </p>
                <p>
                    <a href="Show_Products.aspx">&larr; Back to Shoes</a>
                    &nbsp;|&nbsp;
                    <a href="Show_Company.aspx">Shoe Brands</a>
                    &nbsp;|&nbsp;
                    <a href="Add_To_Cart.aspx">View Cart</a>
                </p>
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <h2><%# Eval("Prod_Model") %></h2>
                        <asp:Image ID="Image1" runat="server" Height="220" Width="280" style="border-radius:10px; object-fit:cover;" ImageUrl='<%# Eval("Prod_Img") %>' />
                        <br />
                        <br />
                        <b>Price: </b>
                        <asp:Label ID="Label1" runat="server" ForeColor="#1c8a4b" Font-Bold="True" Font-Size="Large" Text='<%# "Rs. " + Eval("Prod_Price") %>'></asp:Label>
                        <br />
                        <br />
                        <b>Specifications: </b>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Prod_Config") %>'></asp:Label>
                        <br />
                        <br />
                        <b>Description: </b>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Prod_Desc") %>'></asp:Label>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </center>
        </div>
    </form>
</body>
</html>
