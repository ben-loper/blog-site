using BlogSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlogSite.Database
{
    public interface IBlogDAL
    {
        List<BlogCategoryModel> GetBlogCategories();

        BlogPost GetBlogPostById(int id);
    }
}
