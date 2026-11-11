<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_To_Cart.aspx.cs" Inherits="Database_Connectivity.Add_To_Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Shoes Cart</title>
</head>

<body>
    <form id="form1" runat="server">

        <div>
            <center>

                <h1>My Shoes Cart</h1>

                <p>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </p>

                <p>
                    <a href="Show_Products.aspx">&larr; Continue Shopping (All Shoes)</a>
                    &nbsp;|&nbsp;
                    <a href="Show_Company.aspx">Shoe Brands</a>
                </p>

                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    OnRowCommand="GridView1_RowCommand"
                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">

                    <Columns>

                        <asp:TemplateField HeaderText="Product_Id">
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label6"
                                    runat="server"
                                    DataKeyNames="Prod_Id"
                                    Text='<%# Eval("Prod_Id") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Shoe_Image">
                            <ItemTemplate>
                                <asp:Image
                                    ID="Image1"
                                    runat="server"
                                    ImageUrl='<%# Eval("Prod_Img") %>'
                                    Width="100px"
                                    Height="80px"
                                    style="border-radius:6px; object-fit:cover;" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Shoe_Name">
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label2"
                                    runat="server"
                                    Text='<%# Eval("Prod_Model") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label3"
                                    runat="server"
                                    Text='<%# "Rs. " + Eval("Prod_Price") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity">

                            <EditItemTemplate>

                                <asp:DropDownList
                                    ID="DropDownList1"
                                    runat="server">

                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>

                                </asp:DropDownList>

                            </EditItemTemplate>

                            <ItemTemplate>

                                <asp:Label
                                    ID="Label4"
                                    runat="server"
                                    Text='<%# Eval("Quentity") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:CommandField
                            HeaderText="Change Quantity"
                            ShowEditButton="True" />

                    </Columns>

                </asp:GridView>

                <br />
                <br />
                <asp:Label ID="grand_total" runat="server"></asp:Label>

            </center>
        </div>

    </form>
</body>
</html>