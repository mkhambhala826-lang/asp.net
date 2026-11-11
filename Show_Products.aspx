<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Show_Products.aspx.cs"
    Inherits="Database_Connectivity.Show_Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shoes</title>

    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6f9;
            color: #2b2d33;
        }

        .topbar {
            background: linear-gradient(135deg, #2b5cff, #6a3bff);
            color: #fff;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .topbar h1 {
            margin: 0;
            font-size: 22px;
        }

        .topbar a {
            color: #fff;
            text-decoration: none;
            background: rgba(255,255,255,0.18);
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 14px;
        }

        .topbar a:hover {
            background: rgba(255,255,255,0.32);
        }

        .page-wrap {
            padding: 30px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 22px;
        }

        .product-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 14px rgba(0,0,0,0.08);
            padding: 16px;
            display: flex;
            flex-direction: column;
            transition: transform .15s ease, box-shadow .15s ease;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 22px rgba(0,0,0,0.14);
        }

        .img-frame {
            width: 100%;
            height: 180px;
            border-radius: 8px;
            overflow: hidden;
            background: #f0f1f5;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
        }

        .img-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .prod-name {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 4px;
            min-height: 44px;
        }

        .prod-price {
            font-size: 17px;
            font-weight: 700;
            color: #1c8a4b;
            margin-bottom: 14px;
        }

        .btn-row {
            display: flex;
            gap: 10px;
            margin-top: auto;
        }

        .btn-row .btn {
            flex: 1;
            text-align: center;
            padding: 9px 8px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-view {
            background: #eef0ff;
            color: #2b5cff;
        }

        .btn-view:hover {
            background: #dfe3ff;
        }

        .btn-cart {
            background: #2b5cff;
            color: #fff;
        }

        .btn-cart:hover {
            background: #1c46e0;
        }

        .empty-msg {
            color: #777;
            font-size: 15px;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="topbar">

            <h1>Shoes Collection</h1>

            <div>
                <asp:Label
                    ID="Label3"
                    runat="server">
                </asp:Label>

                &nbsp;

                <a href="Show_Company.aspx">
                    &larr; Back to Shoe Brands
                </a>

                &nbsp;

                <a href="Add_To_Cart.aspx">
                    View Cart
                </a>
            </div>

        </div>

        <div class="page-wrap">

            <asp:DataList
                ID="DataList1"
                runat="server"
                RepeatLayout="Flow"
                CssClass="product-grid"
                OnItemCommand="DataList1_ItemCommand">

                <ItemTemplate>

                    <div class="product-card">

                       
                        <div class="img-frame">

                            <asp:Image
                                ID="Image1"
                                runat="server"
                                ImageUrl='<%# Eval("Prod_Img") %>' />

                        </div>


                      
                        <div class="prod-name">

                            <asp:Label
                                ID="Label1"
                                runat="server"
                                Text='<%# Eval("Prod_Model") %>'>
                            </asp:Label>

                        </div>


                      
                        <div class="prod-price">

                            <asp:Label
                                ID="Label2"
                                runat="server"
                                Text='<%# Eval("Prod_Price") == DBNull.Value ? "Rs. 0.00" : "Rs. " + Convert.ToDecimal(Eval("Prod_Price")).ToString("N2") %>'>
                            </asp:Label>

                        </div>



                        <div class="btn-row">

                            <asp:LinkButton
                                ID="btnView"
                                runat="server"
                                CssClass="btn btn-view"
                                CommandName="cmd_view"
                                CommandArgument='<%# Eval("Prod_Id") %>'>

                                View Details

                            </asp:LinkButton>


                            <asp:LinkButton
                                ID="btnCart"
                                runat="server"
                                CssClass="btn btn-cart"
                                CommandName="cmd_cart"
                                CommandArgument='<%# Eval("Prod_Id") %>'>

                                Add to Cart

                            </asp:LinkButton>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:DataList>



            <asp:Label
                ID="lblEmpty"
                runat="server"
                CssClass="empty-msg"
                Text="No shoes found for this brand."
                Visible="false">
            </asp:Label>

        </div>

    </form>

</body>
</html>