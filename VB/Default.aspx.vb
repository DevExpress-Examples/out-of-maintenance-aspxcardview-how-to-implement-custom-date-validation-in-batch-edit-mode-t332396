Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Private Function CheckYears(ByVal hireDate As Date, ByVal birthDate As Date) As Boolean
        Dim span As TimeSpan = hireDate.Subtract(birthDate)
        If span.TotalDays / 365 < 18 Then
            Return False
        Else
            Return True
        End If
    End Function
    Private Sub AddError(ByVal errors As Dictionary(Of CardViewColumn, String), ByVal column As CardViewColumn, ByVal errorText As String)
        If errors.ContainsKey(column) Then
            Return
        End If
        errors(column) = errorText
    End Sub

    Protected Sub ASPxCheckBox2_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        ASPxCardView1.SettingsEditing.BatchEditSettings.AllowValidationOnEndEdit = Not ASPxCheckBox2.Checked
    End Sub
    Protected Sub ASPxCardView1_CardValidating(ByVal sender As Object, ByVal e As ASPxCardViewDataValidationEventArgs)
        Dim birthDate As Date = CDate(e.NewValues("BirthDate"))
        Dim hireDate As Date = CDate(e.NewValues("HireDate"))
        Dim result = CheckYears(hireDate, birthDate)
        If Not result Then
            AddError(e.Errors, ASPxCardView1.Columns("BirthDate"), "Invalid difference between Hire Date and Birth Date")
            AddError(e.Errors, ASPxCardView1.Columns("HireDate"), "Invalid difference between Hire Date and Birth Date")
            e.CardError = "Correct validation errors"
        Else
            e.CardError = "Modifications aren't allowed in the online example. </br>If you need to test the data editing functionality, please download the example on your machine and run it locally."
        End If
    End Sub

End Class