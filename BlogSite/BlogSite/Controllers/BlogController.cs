using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BlogSite.Database;
using BlogSite.Models;
using Microsoft.AspNetCore.Mvc;

namespace BlogSite.Controllers
{
    public class BlogController : Controller
    {
        IBlogDAL _blogDAL;

        public BlogController(IBlogDAL blogDAL)
        {
            _blogDAL = blogDAL;
        }

        public IActionResult Index()
        {
            List<BlogCategoryModel> categories = _blogDAL.GetBlogCategories();

            return View(categories);
        }

        public IActionResult BlogsByCategory(int categoryId)
        {
            List<BlogPost> blogs = new List<BlogPost>();

            return View(blogs);
        }
    }
}