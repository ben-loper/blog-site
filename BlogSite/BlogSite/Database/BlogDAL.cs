using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using BlogSite.Models;

namespace BlogSite.Database
{
    public class BlogDAL : IBlogDAL
    {
        private string _connectionString;

        public BlogDAL(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<BlogCategoryModel> GetBlogCategories()
        {
            List<BlogCategoryModel> categories = new List<BlogCategoryModel>();

            string getCategoriesSql = "SELECT * FROM categories";

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(getCategoriesSql, conn);
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    BlogCategoryModel category = new BlogCategoryModel();

                    category.Id = Convert.ToInt32(reader["id"]);
                    category.Name = Convert.ToString(reader["name"]);
                    category.Description = Convert.ToString(reader["description"]);

                    categories.Add(category);
                }
            }

            return categories;
        }

        public BlogPost GetBlogPostById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
