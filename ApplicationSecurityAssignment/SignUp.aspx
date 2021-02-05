<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ApplicationSecurityAssignment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <script type ="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tb_password.ClientID %>').value;
            if (str.length < 8) {
                document.getElementById("lbl_pwdsuggestion").innerHTML = "Password Length must be at Least 8 Characters";
                document.getElementById("lbl_pwdsuggestion").style.color = "Red";
                return ("too_short");
            }
            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lbl_pwdsuggestion").innerHTML = "Password require at least 1 Lower Case Letter";
                document.getElementById("lbl_pwdsuggestion").style.color = "Red";
                return ("no_lower_case");
            }
            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lbl_pwdsuggestion").innerHTML = "Password require at least 1 Upper Case Letter";
                document.getElementById("lbl_pwdsuggestion").style.color = "Red";
                return ("no_upper_case");
            }
            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lbl_pwdsuggestion").innerHTML = "Password require at least 1 number";
                document.getElementById("lbl_pwdsuggestion").style.color = "Red";
                return ("no_number");
            }
            else if (str.search(/[@!#$%^&*(),.?:{}|<>]/) == -1) {
                document.getElementById("lbl_pwdsuggestion").innerHTML = "Password is suggested to contain at least 1 special character.";
                document.getElementById("lbl_pwdsuggestion").style.color = "Red";
                return ("no_number");
            }
            document.getElementById("lbl_pwdsuggestion").innerHTML = "Password is very strong!.";
            document.getElementById("lbl_pwdsuggestion").style.color = "Green";
        }
        function validateSecondary() {
            var passwordOne = document.getElementById('<%=tb_password.ClientID %>').value;
            var passwordTwo = document.getElementById('<%=tb_confirmpassword.ClientID %>').value;

            if (passwordOne != passwordTwo) {
                document.getElementById("lbl_conpwdsuggestion").innerHTML = "Passwords do not match";
                document.getElementById("lbl_conpwdsuggestion").style.color = "Red";
                return ("no_match");
            }
            else {
                document.getElementById("lbl_conpwdsuggestion").innerHTML = "";
            }

        }
        function validateEmail() {
            var str = document.getElementById('<%=tb_emailaddress.ClientID %>').value;
            if (str.search(/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/) == -1 ) {
                document.getElementById("lbl_emailsuggestion").innerHTML = "Please input a valid email";
                document.getElementById("lbl_emailsuggestion").style.color = "Red";
                return ("email_ivalid");
            }
            else {
                document.getElementById("lbl_emailsuggestion").innerHTML = "";
            }
        }
        function validateCreditCard() {
            var str = document.getElementById('<%=tb_emailaddress.ClientID %>').value;
            if (str.search(/^[0-9]*$/) == -1) {
                document.getElementById("lbl_creditcardsuggestion").innerHTML = "Please input a valid credit card number";
                document.getElementById("lbl_creditcardsuggestion").style.color = "Red";
                return ("Credit_card_ivalid");
            }
            else {
                document.getElementById("lbl_creditcardsuggestion").innerHTML = "";
            }
        }
        function validateName() {
            var str = document.getElementById('<%=tb_emailaddress.ClientID %>').value;
            if (str == null || str == "") {
                document.getElementById("lbl_emailsuggestion").innerHTML = "Please input a valid email";
                document.getElementById("lbl_emailsuggestion").style.color = "Red";
                return ("email_ivalid");
            }
            else {
                document.getElementById("lbl_emailsuggestion").innerHTML = "";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
            <asp:Label ID="lbl_firstname" runat="server" Text="First Name: "></asp:Label>
            <asp:TextBox ID="tb_firstname" runat="server" use="required"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lbl_lastname" runat="server" Text="Last Name: "></asp:Label>
            <asp:TextBox ID="tb_lastname" runat="server" use="required"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lbl_creditCard" runat="server" Text="Credit Card Info: "></asp:Label>
            <asp:TextBox ID="tb_creditCard" runat="server"  onkeyup ="javascript:validateCreditCard()" TextMode="Number" use="required"></asp:TextBox>
            <asp:Label ID="lbl_creditcardsuggestion" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Label ID="lbl_emailaddress" runat="server" Text="Email Address: "></asp:Label>
            <asp:TextBox ID="tb_emailaddress" runat="server" onkeyup ="javascript:validateEmail()" TextMode="Email" use="required"></asp:TextBox>
            <asp:Label ID="lbl_emailsuggestion" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label>
            <asp:TextBox ID="tb_password" runat="server" TextMode ="Password" autocomplete ="off" onkeyup ="javascript:validate()" use="required"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_pwdsuggestion" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lbl_pwdchecker" runat="server" Text=""></asp:Label>
                <br />
            <asp:Label ID="lbl_confirmpassword" runat="server" Text="Confirm Password: "></asp:Label>
            <asp:TextBox ID="tb_confirmpassword" runat="server" TextMode ="Password" autocomplete ="off" onkeyup ="javascript:validateSecondary()" use="required"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_conpwdsuggestion" runat="server" Text=""></asp:Label>
            <br /> 
            <br />
            <asp:Label ID="lbl_dob" runat="server" Text="Date Of Birth: "></asp:Label>
            <asp:TextBox ID="tb_dob" runat="server" TextMode="Date" use="required"></asp:TextBox>
                <br />
            <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="signupbutton" runat="server" Text="Sign Up" OnClick="signupbutton_Click" />
            </fieldset>
        </div>
    </form>
</body>
</html>
