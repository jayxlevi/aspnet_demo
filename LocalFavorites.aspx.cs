using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace FinalProject

{
    public partial class LocalFavorites : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["LocalPoll_ConnString"].ConnectionString;

        public LocalPoll poll = new LocalPoll();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //setting the form data to the appropriate variable in the LocalPoll class, also encodes the business name in case they're an apostraphe or something
            string business = Server.HtmlEncode(txtBusinessName.Text);
            poll.businessName = business;
            poll.category = drpDownCategory.Text;
            poll.rating = Convert.ToInt32(drpDownRating.Text);

            //try/catch block for the SQL stuff
            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                string query = $"INSERT INTO poll_results VALUES('{poll.businessName}', '{poll.category}', '{poll.rating}')";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                conn.Close();
            }//end of try
            catch (Exception ex)
            {
                throw ex;
            }//end of catch

            //once the query stuff is done, this will redirect you to the appropriate page
            if(poll.category == "Other")
            {
                Response.Redirect("Businesses");
            }//end of other
            else if(poll.category == "Restaurant")
            {
                Response.Redirect("Restaurants");
            }//end of Restaurants
            else if(poll.category == "Outdoors")
            {
                Response.Redirect("Outdoors");
            }//end of Outdoors


        }//end of btnAdd_Click
    }
}