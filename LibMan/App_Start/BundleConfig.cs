using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace LibMan
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/moment.js",
                            "~/Scripts/jquery-3.5.1.min.js",
                            "~/Scripts/Jquery.signalr.js",
                            "~/Scripts/jquery-ui.min.js",
                            "~/Scripts/PreventPage.js",
                            "~/Scripts/DataTable.js",
                            "~/Scripts/dataTables.buttons.min.js",
                            "~/Scripts/jszip.min.js",
                            "~/Scripts/pdfmake.min.js",
                            "~/Scripts/vfs_fonts.js",
                            "~/Scripts/buttons.html5.min.js",
                            "~/Scripts/bootstrap-switch.js",
                            "~/Scripts/jquery.alphanumeric.pack.js",
                            "~/Scripts/AlertMsg.js",
                            "~/Scripts/sweetalert.min.js",
                            "~/Scripts/jquery.multiselect.js",
                            "~/Scripts/Validation.js",
                            "~/Scripts/popper.min.js",
                            "~/Scripts/bootstrap.min.js",
                            "~/Scripts/Common.js",
                            "~/Scripts/owl.carousel.min.js",
                            "~/Scripts/chart.js"
                            ));

            bundles.Add(new ScriptBundle("~/bundles/ReportsJs").Include(
                          "~/pages/Admin/JS/tether.min.js",
                          "~/pages/Admin/JS/Reports.js"
                          ));

            bundles.Add(new ScriptBundle("~/bundles/PrescJs").Include(
                    "~/Scripts/moment.js",
                    "~/Scripts/jquery-3.5.1.min.js",
                    "~/Scripts/jquery-ui.min.js",
                    "~/Scripts/PreventPage.js",
                    "~/Scripts/DataTable.js",
                    "~/Scripts/dataTables.buttons.min.js",
                    "~/Scripts/bootstrap-switch.js",
                    "~/Scripts/jquery.alphanumeric.pack.js",
                    "~/Scripts/AlertMsg.js",
                    "~/Scripts/sweetalert.min.js",
                    "~/Scripts/jquery.multiselect.js",
                    "~/Scripts/JSLINQ.js",
                    "~/Scripts/Validation.js",
                    "~/Scripts/popper.min.js",
                    "~/Scripts/bootstrap.min.js",
                    "~/Scripts/Common.js",
                    "~/Scripts/owl.carousel.min.js",
                    "~/pages/Doctor/JS/script.js"

                          ));

            bundles.Add(new StyleBundle("~/bundles/DefCss").Include(
                "~/Content/bootstrap.min.css",
                "~/Content/all.min.css",
                "~/Content/Common.css",
                "~/Content/Style.css",
                "~/Content/responsive.css"
                ));

            bundles.Add(new StyleBundle("~/bundles/AdminCss").Include(
                "~/Content/bootstrap.min.css",
                "~/Content/bootstrap-multiselect.css",
                "~/Content/all.min.css",
                "~/Content/Common.css",
                "~/Content/jquery-ui.min.css",
                "~/Content/DataTable.css",
                "~/Content/owl.carousel.min.css",
                "~/Content/owl.theme.default.min.css",
                "~/Content/sweetalert.css",
                "~/pages/Admin/Css/style.css",
                "~/pages/Admin/Css/responsive.css"
                ));

            bundles.Add(new StyleBundle("~/bundles/ReportCss").Include(
                     "~/pages/Admin/Css/animate.min.css",
                     "~/pages/Admin/Css/tether.min.css",
                     "~/pages/Admin/Css/Reports.css",
                "~/pages/Admin/Css/Reportsresponsive.css"
                ));

            bundles.Add(new StyleBundle("~/bundles/PrescCSS").Include(
                        "~/Content/bootstrap.min.css",
                        "~/Content/bootstrap-multiselect.css",
                        "~/Content/all.min.css",
                        "~/Content/Common.css",
                        "~/Content/jquery-ui.min.css",
                        "~/Content/DataTable.css",
                        "~/Content/owl.carousel.min.css",
                        "~/Content/owl.theme.default.min.css",
                        "~/Content/sweetalert.css",
                        "~/pages/Doctor/CSS/style.css",
                        "~/pages/Doctor/CSS/responsive.css"
                ));

            // BundleTable.EnableOptimizations = true;
        }
    }
}