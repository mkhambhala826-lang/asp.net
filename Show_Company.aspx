<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show_Company.aspx.cs" Inherits="Database_Connectivity.Show_Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shoe Brands</title>

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

        .company-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(210px, 1fr));
            gap: 22px;
        }

        .company-box {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 14px rgba(0,0,0,0.08);
            padding: 16px;
            text-align: center;
            transition: transform .15s ease, box-shadow .15s ease;
        }

            .company-box:hover {
                transform: translateY(-4px);
                box-shadow: 0 8px 22px rgba(0,0,0,0.14);
            }

        .img-frame {
            width: 100%;
            height: 150px;
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

        .company-name {
            font-size: 16px;
            font-weight: 600;
            color: #2b5cff;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
        }

            .company-name:hover {
                text-decoration: underline;
            }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="topbar">

            <h1>Shoe Brands</h1>

            <div>

                <asp:Label
                    ID="Label1"
                    runat="server">
                </asp:Label>

                &nbsp;

                <asp:HyperLink
                    ID="ShowCompany"
                    runat="server"
                    NavigateUrl="Show_Products.aspx">
                    Show Shoes
                </asp:HyperLink>

                <asp:HyperLink
                    ID="ShowCart"
                    runat="server"
                    NavigateUrl="Add_To_Cart.aspx">
                     View Cart
                </asp:HyperLink>

                <a href="Add_Company.aspx">Add Brand</a>

                <a href="Add_Products.aspx">Add Shoes</a>

            </div>

        </div>

        <div class="page-wrap">

            <asp:DataList
                ID="DataList1"
                runat="server"
                RepeatLayout="Flow"
                CssClass="company-grid"
                OnItemCommand="DataList1_ItemCommand">

                <ItemTemplate>

                    <div class="company-box">

                        <div class="img-frame">

                            <asp:Image
                                ID="Image1"
                                runat="server"
                                ImageUrl='<%# Eval("Comp_Cover_Img") %>' />

                        </div>

                        <asp:LinkButton
                            ID="LinkButton1"
                            runat="server"
                            CssClass="company-name"
                            Text='<%# Eval("Comp_Name") %>'
                            CommandArgument='<%# Eval("Comp_Id") %>'
                            CommandName="cmd_cid">
                        </asp:LinkButton>

                    </div>

                </ItemTemplate>

            </asp:DataList>

        </div>

    </form>

</body>
</html>
