<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NoteBookWebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>NoteBook</h1>
        <p class="lead">Contacts:</p>
        <p><span class="glyphicon glyphicon-envelope"></span> aa</p>
    </div>
<div id="vue">
    <div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>{{contactId}}</th>
                    <th>{{contactName}}</th>
                    <th>{{contactEmail}}</th>
                    <th>{{contactMobile}}</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="c in ContactsData">
                    <td>{{c.ContactID}}</td>
                    <td>{{c.Name}}</td>
                    <td>{{c.Email}}</td>
                    <td>{{c.Mobile}}</td>
                    <td><a href="#"><span class="glyphicon glyphicon-edit"></span></a>
                        <a href="#"><span class="glyphicon glyphicon-remove"></span></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <div><button type="button" class="btn btn-success btn-md">new contact</button></div>
    </div>  
    <div v-if="false">

    </div>
</div>

    <script type="text/javascript">
        var app = new Vue({
            el: '#vue',

            data: {
                contactId: '№',
                contactName: 'Name',
                contactEmail: 'Email',
                contactMobile: 'Mobile',
                ContactsData: null
            },

            mounted() {
                axios
                    .get('http://localhost:64617/api/Contact')
                    .then(response => (this.ContactsData = response.data))
                    .catch(error => console.log(error));
            },
        });
    </script>
</asp:Content>
