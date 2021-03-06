﻿using DocSoOperation.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SQIndustryThree.DAL;
using SQIndustryThree.Models;
using SQIndustryThree.Models.BillApproval;
using SQIndustryThree.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SQIndustryThree.Controllers
{
    public class BillApprovalController : Controller
    {
        BasicUtilities _BasicUtilities = new BasicUtilities();
        // GET: BillApproval
        BillApprovalDAL billDal = new BillApprovalDAL();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BillApprovalRequest()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            return View();
        }
        public ActionResult MyRequestSoFar()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            return View();
        }
        public ActionResult POUploadInterface()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            return View();
        }
        [HttpPost]
        public ActionResult UploadExcelData(List<BillAprrovalPoDetails> billAprrovalPoDetails)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            int userid = Convert.ToInt32(Session["SQuserId"]);

            //ViewBag.POList = billAprrovalPoDetails

            //List<BillAprrovalPoDetails> billAprrovalPoDetails= JsonConvert.DeserializeObject<List<BillAprrovalPoDetails>>(datalist.ToString());
            //return RedirectToAction("POUploadInterface", "BillApproval");
            //return Json(billDal.BillApprovalDatabase(billAprrovalPoDetails, userid),JsonRequestBehavior.AllowGet);
            return PartialView("_ExcelPartialView", billAprrovalPoDetails);
        }
        [HttpPost]
        public ActionResult GetBillApprovalPolist(int Status)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            int userid = Convert.ToInt32(Session["SQuserId"]);
            //List<BillAprrovalPoDetails> billAprrovalPoDetails= JsonConvert.DeserializeObject<List<BillAprrovalPoDetails>>(datalist.ToString());
            return Json(billDal.GetAllBillAPpprovalPo(Status), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult GetIndividualPODetails(int PoMasterKey,int BUnit,int CatKey)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            int userid = Convert.ToInt32(Session["SQuserId"]);
            return PartialView("_podetailsview", billDal.IndividualPOetailS(PoMasterKey,BUnit,CatKey));
        }
        [HttpPost]
        public ActionResult PreviewApproval(BillApprovalPOMasterTable billApprovalPOMasterTable)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            int userid = Convert.ToInt32(Session["SQuserId"]);
            return PartialView("_submitForApprovalModal", billApprovalPOMasterTable);
        }

        //[HttpPost]
        //public ActionResult GetAllBillRequest(int status)
        //{
        //    if (Session["SQuserId"] == null)
        //    {
        //        return RedirectToAction("Index", "Account");
        //    }
        //    int userid = Convert.ToInt32(Session["SQuserId"]);
        //    return PartialView("_RequestListSoFar", billDal.GetBillRequestList(status,userid));
        //}
        [HttpPost]
        public ActionResult SubmitForBillApprovalRequest(BillApprovalPOMasterTable billApprovalPOMasterTable)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            int userid = Convert.ToInt32(Session["SQuserId"]);
            return Json(billDal.SubmitForBillApprovalRequest(billApprovalPOMasterTable.Polist,userid, billApprovalPOMasterTable.BusinessUnitId, billApprovalPOMasterTable.CategoryId));
        }


        #region Bill Entry


        public ActionResult BillEntry()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }



            return View();
        }

        public ActionResult ModalShowBeforeSubmit(BillRequestMaster billRequestMaster)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            int userID = Convert.ToInt32(Session["SQuserId"].ToString());
            return PartialView("_MyBillPreview", billRequestMaster);

        }

        public ActionResult SaveBillRequest(BillRequestMaster billRequestMaster)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            Session[AMSSession.BillInfoList] = billRequestMaster.BillInfoList;

            ResultResponse result = new ResultResponse();
            int userID = Convert.ToInt32(Session["SQuserId"].ToString());
            result = billDal.SaveBillRequest(billRequestMaster, userID);

            if (Session[AMSSession.BillInfoList] != null)
            {
                foreach (var item in (List<InvoiceInformation>)Session[AMSSession.BillInfoList])
                {
                    var POUpdate = billDal.UpdatePODetails(Convert.ToDouble(item.InvoiceQty), Convert.ToDouble(item.InvoiceBalance), item.PODetailsKey);
                }
            }

            

            Session[AMSSession.InvoiceKey] = result.pk;
            Session[AMSSession.InvoiceNo] = billRequestMaster.InvoiceNo;

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult InvoiceList()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            return View();
        }

        public ActionResult GetBillPartial(string viewName)
        {
            if (base.Session["SQuserId"] != null)
            {
                return base.PartialView(viewName);
            }
            return base.RedirectToAction("Index", "Account");
        }

        [HttpPost]
        public ActionResult GetAllBillRequest(int Status, string ViewName, int Progrss)
        {
            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }

            List<Dictionary<string, object>> _dtResult = new List<Dictionary<string, object>>();
            List<Dictionary<string, object>> _dtApproverList = new List<Dictionary<string, object>>();

            int userID = Convert.ToInt32(base.Session["SQuserId"].ToString());
            var _list = billDal.GetAllBillRequest(userID, Status, Progrss);

            _dtResult = _BasicUtilities.GetTableRows(_list);

           // int dValue = _list.Rows[0].Field<int>("InvoiceKey");
            //var _dtApprover = 0;
            //select row.Table[0]["InvoiceKey"];

            //var _dtApprover = from row in billDal.GetApproverListByInvoiceKey(dValue).AsEnumerable()
            //                  where row.Field<int>("ApproverNo") == 1
            //                        //&& row.Field<int>("UserId") == userID
            //                  select row.Field<int>("UserId");

            //("ApproverNo = 1 AND UserId = "+ userID + "");
            //_dtApproverList = _BasicUtilities.GetTableRows(_dtApprover);
            //if (Status != 1 && Progrss != 0)
            //{
            //     _dtApprover = billDal.GetApproverListByInvoiceKey(dValue).Select("UserId = " + userID + "").FirstOrDefault().Field<int>("ApproverNo");
            //}
            

            ViewBag.BillList = _dtResult;
            ViewBag.ApproverNo = 1;

            return this.PartialView(ViewName);
        }

        [HttpPost]
        public ActionResult BillRequestDetails(int MasterID, string ViewName, int Status)
        {
            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }
            int userID = Convert.ToInt32(base.Session["SQuserId"].ToString());
            BillRequestMaster billRequest = billDal.GetBillInforamtion(MasterID, userID);
            billRequest.Status = Status;
            return this.PartialView(ViewName, billRequest);
        }

        public ActionResult BillApproval()
        {
            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }
            int userID = Convert.ToInt32(base.Session["SQuserId"].ToString());

            return base.View();
        }

        public ActionResult SupplierList()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            try
            {
               
                DataTable dt = billDal.SupplierList();
                //   List<Dictionary<string, object>>
                List<Dictionary<string, object>> _List = _BasicUtilities.GetTableRows(dt);

                return Json(_List);
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }

        public ActionResult InvoiceTypeList()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            try
            {

                DataTable dt = billDal.InvoiceTypeList();
                //   List<Dictionary<string, object>>
                List<Dictionary<string, object>> _List = _BasicUtilities.GetTableRows(dt);

                return Json(_List);
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }

        public ActionResult QualityResultList()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            try
            {

                DataTable dt = billDal.QualityResultList();
                //   List<Dictionary<string, object>>
                List<Dictionary<string, object>> _List = _BasicUtilities.GetTableRows(dt);

                return Json(_List);
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }

        public ActionResult ApproverList(int invoiceType)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            try
            {

                DataTable dt = billDal.InvoiceTypeWiseApproverList(invoiceType);
                //   List<Dictionary<string, object>>
                List<Dictionary<string, object>> _List = _BasicUtilities.GetTableRows(dt);

                return Json(_List);
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }


        public ActionResult POList(int supplierId)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            try
            {
                DataTable dt = billDal.POList(supplierId);
                //   List<Dictionary<string, object>>
                List<Dictionary<string, object>> _List = _BasicUtilities.GetTableRows(dt);

                return Json(_List);
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }

        public ActionResult AddQuality()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            try
            {
                if (Session[AMSSession.InvoiceKey] != null)
                {
                    ViewBag.InvoiceNo = Session[AMSSession.InvoiceNo].ToString();
                    ViewBag.InvoiceKey = Session[AMSSession.InvoiceKey].ToString();
                }
                

                return View();
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }

        //public ActionResult AddQuality(int InvoiceKey, string InvoiceNo)
        //{
        //    if (Session["SQuserId"] == null)
        //    {
        //        return RedirectToAction("Index", "Account");
        //    }
        //    try
        //    {
        //        if (Session[AMSSession.InvoiceKey] != null)
        //        {
        //            ViewBag.InvoiceNo = InvoiceNo;
        //            ViewBag.InvoiceKey = InvoiceKey;
        //        }


        //        return View();
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(ex.Message);
        //    }
        //}

        public ActionResult UpdateQuality(int InvoiceKey, string InvoiceNo)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            try
            {
                @ViewBag.InvoiceKey = InvoiceKey;
                @ViewBag.InvoiceNo = InvoiceNo;

                int result = billDal.CheckQuality(InvoiceKey);

                if (result != 0)
                {
                    var dt = billDal.QualityList(InvoiceKey);
                    List<Dictionary<string, object>> _List = _BasicUtilities.GetTableRows(dt);

                    var dt_qulityResult = billDal.QualityResultList();
                    List<Dictionary<string, object>> _ResultList = _BasicUtilities.GetTableRows(dt_qulityResult);

                    ViewBag.QList = _List;
                    ViewBag.ResultList = _ResultList;
                }
                else
                {
                    Session[AMSSession.InvoiceKey] = InvoiceKey;
                    Session[AMSSession.InvoiceNo] = InvoiceNo;

                    return View("AddQuality");
                }

                

                return View();
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
            }
        }

        [HttpPost]
        public ActionResult DeleteQualityFiles(int invoicekey, int qualityID)
        {
            int userID = Convert.ToInt32(Session["SQuserId"].ToString());
            List<BillQuality> capexFileUploadDetails = billDal.GetUploadedFilesByID(invoicekey, userID);
            bool rest = false;
            if (capexFileUploadDetails.Count > 0 || capexFileUploadDetails == null)
            {
                foreach (BillQuality f in capexFileUploadDetails)
                {
                    try
                    {
                        if (!string.IsNullOrEmpty(f.FileName))
                        {
                            System.IO.File.Delete(f.FilPath);
                            
                        }
                        
                    }
                    catch (IOException ioExp)
                    {
                        Console.WriteLine(ioExp.Message);
                    }
                }

                rest = billDal.DeleteFileFromDatabase(invoicekey, "", "", userID);
            }
            else
            {
                rest = false;
            }
            return Json(rest, JsonRequestBehavior.AllowGet);
        }

        public ActionResult EntryQuality(int invoiceKey, string invoiceNo, string item, string result, string comment, string fileName, string filePath)
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }

            string itemTrim = item.TrimEnd(',');
            string resultTrim = result.TrimEnd(',');
            string commentTrim = comment.TrimEnd(',');
            string fileNameTrim = fileName.TrimEnd(',');
            string filePathTrim = filePath.TrimEnd(',');
            List<string> itemList = itemTrim.Split(',').ToList();
            List<string> resultList = resultTrim.Split(',').ToList();
            List<string> commentList = commentTrim.Split(',').ToList();
            List<string> fileNameList = fileNameTrim.Split(',').ToList();
            List<string> filePathList = filePathTrim.Split(',').ToList();

            int userID = Convert.ToInt32(Session["SQuserId"].ToString());
            billDal.DeleteQualityFromDatabase(invoiceKey, userID);

            
            var saveQuality = false;
            if (invoiceKey != 0 && !string.IsNullOrEmpty(invoiceNo) && itemList != null)
            {
                for (int i = 0; i < itemList.Count; i++)
                {
                    if (!string.IsNullOrEmpty(itemList[i]))
                    {
                        var f = string.Empty;
                        var p = string.Empty;

                        if (fileNameList[i] == "undefined")
                        {
                            f = "";
                        }
                        else
                        {
                            f = fileNameList[i];
                        }

                        if (filePathList[i] == "undefined")
                        {
                            p = "";
                        }
                        else
                        {
                            p = filePathList[i];
                        }

                        saveQuality = billDal.SaveQuality(invoiceKey, invoiceNo, itemList[i], resultList[i], commentList[i], f, p, userID);
                    }                   
                }                
            }

            return Json(saveQuality);
        }


        public ActionResult BillFileUpload()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            List<BillFileUploadDetails> fileuploadList = new List<BillFileUploadDetails>();
            if (Request.Files.Count > 0)
            {
                var files = Request.Files;
                foreach (string str in files)
                {
                    HttpPostedFileBase file = Request.Files[str] as HttpPostedFileBase;
                    //Checking file is available to save.  
                    if (file != null)
                    {
                        var currentmilse = DateTime.Now.Ticks;
                        var InputFileName = Path.GetFileNameWithoutExtension(file.FileName);
                        var InputFileExtention = Path.GetExtension(file.FileName);
                        var FullFileWithext = InputFileName + currentmilse + InputFileExtention;
                        var ServerSavePath = Path.Combine(Server.MapPath("~/BillFileUpload/") + FullFileWithext);
                        //Save file to server folder  
                        file.SaveAs(ServerSavePath);
                        BillFileUploadDetails fileUploadModel = new BillFileUploadDetails();
                        fileUploadModel.BillFileName = file.FileName.ToString();
                        fileUploadModel.BillFilePath = ServerSavePath;
                        fileUploadModel.ServerFileName = FullFileWithext;
                        fileuploadList.Add(fileUploadModel);
                    }
                }
            }
            return Json(fileuploadList, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult BillDeleteFiles(string FilePath)
        {
            bool result = false;
            try
            {
                System.IO.File.Delete(Server.MapPath("~/BillFileUpload/") + FilePath);
                result = true;
            }
            catch (IOException ioExp)
            {
                Console.WriteLine(ioExp.Message);
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public FileResult DownloadFile(string filepath, string filename)
        {
            //string name = Path.GetFileName(filename);
            //var ServerSavePath = Path.Combine(Server.MapPath("~/Uploads/") + name);
            //return File(ServerSavePath, "image/png");
            byte[] fileBytes = System.IO.File.ReadAllBytes(filepath);
            string fileName = filename;
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, Path.GetFileName(filepath));

            //string fname = Path.GetFileName(filename);
            //Response.ContentType = "application/octet-stream";
            //Response.AppendHeader("Content-Disposition", "attachment;filename=" + fname);
            //string aaa = Server.MapPath("~/Uploads/" + fname);
            //Response.TransmitFile(Server.MapPath("~/Uploads/" + fname));
            //Response.End();
        }

        public FileResult QualityDownloadFile(string filepath, string filename)
        {
            //string name = Path.GetFileName(filename);
            //var ServerSavePath = Path.Combine(Server.MapPath("~/Uploads/") + name);
            //return File(ServerSavePath, "image/png");
            byte[] fileBytes = System.IO.File.ReadAllBytes(filepath);
            string fileName = filename;
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, Path.GetFileName(filepath));

            //string fname = Path.GetFileName(filename);
            //Response.ContentType = "application/octet-stream";
            //Response.AppendHeader("Content-Disposition", "attachment;filename=" + fname);
            //string aaa = Server.MapPath("~/Uploads/" + fname);
            //Response.TransmitFile(Server.MapPath("~/Uploads/" + fname));
            //Response.End();
        }

        public ActionResult QualityFileUpload()
        {
            if (Session["SQuserId"] == null)
            {
                return RedirectToAction("Index", "Account");
            }
            List<QualityFileUploadDetails> fileuploadList = new List<QualityFileUploadDetails>();
            if (Request.Files.Count > 0)
            {
                var files = Request.Files;
                foreach (string str in files)
                {
                    HttpPostedFileBase file = Request.Files[str] as HttpPostedFileBase;
                    //Checking file is available to save.  
                    if (file != null)
                    {
                        var currentmilse = DateTime.Now.Ticks;
                        var InputFileName = Path.GetFileNameWithoutExtension(file.FileName);
                        var InputFileExtention = Path.GetExtension(file.FileName);
                        var FullFileWithext = InputFileName + currentmilse + InputFileExtention;
                        var ServerSavePath = Path.Combine(Server.MapPath("~/QualityFileUpload/") + FullFileWithext);
                        //Save file to server folder  
                        file.SaveAs(ServerSavePath);
                        QualityFileUploadDetails fileUploadModel = new QualityFileUploadDetails();
                        fileUploadModel.QualityFileName = file.FileName.ToString();
                        fileUploadModel.QualityFilePath = ServerSavePath;
                        fileUploadModel.ServerFileName = FullFileWithext;
                        fileuploadList.Add(fileUploadModel);
                    }
                }
            }
            return Json(fileuploadList, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult QualityDeleteFiles(string FilePath)
        {
            bool result = false;
            try
            {
                System.IO.File.Delete(Server.MapPath("~/QualityFileUpload/") + FilePath);
                result = true;
            }
            catch (IOException ioExp)
            {
                Console.WriteLine(ioExp.Message);
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }


        public ActionResult BillApproveOrReject(string CommentText, int Progress, int RequestorId, string invoiceDetailKey, string verifyQty, string verifyValue)
        {
            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }
            int userID = Convert.ToInt32(base.Session["SQuserId"].ToString());

            string invoiceDetailKeyTrim = invoiceDetailKey.TrimEnd(',');
            string verifyQtyTrim = verifyQty.TrimEnd(',');
            string verifyValueTrim = verifyValue.TrimEnd(',');
            List<string> invoiceDetailKeyList = invoiceDetailKeyTrim.Split(',').ToList();
            List<string> verifyQtyList = verifyQtyTrim.Split(',').ToList();
            List<string> verifyValueList = verifyValueTrim.Split(',').ToList();

            var approvalInfo = this.billDal.BillApproveOrReject(Progress, CommentText, userID, RequestorId);
            if (invoiceDetailKeyList != null)
            {
                for (int i = 0; i < invoiceDetailKeyList.Count; i++)
                {
                    if (Convert.ToInt32(invoiceDetailKeyList[i]) != 0)
                    {
                        if (verifyQtyList[i] != "undefined")
                        {
                            billDal.UpdateInvoiceBill(Convert.ToInt32(invoiceDetailKeyList[i]), Convert.ToDecimal(verifyValueList[i]), Convert.ToDecimal(verifyQtyList[i]), userID);
                        }

                        
                    }
                }
            }
            

            return base.Json(approvalInfo, JsonRequestBehavior.AllowGet);
        }

        public ActionResult QualityExist(int InvoiceKey)
        {
            //int result = 0;

            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }

           int result = billDal.CheckQuality(InvoiceKey);

            return Json(result);
        }

        public ActionResult QualityPreview(int InvoiceKey, string ViewName)
        {
            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }
            int userID = Convert.ToInt32(base.Session["SQuserId"].ToString());
            var billQuality = billDal.GetQualityInforamtion(InvoiceKey);
            var _dtApprover = billDal.GetApproverListByInvoiceKey(InvoiceKey).Select("UserId = " + userID + "").FirstOrDefault().Field<int>("ApproverNo");
            ViewBag.ApproverNo = _dtApprover;
            //billRequest.Status = Status;
            return this.PartialView(ViewName, billQuality);
        }

        public ActionResult UpdateQualityRating(string qualityId, string rate, string rate_name)
        {
            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }
            int userID = Convert.ToInt32(base.Session["SQuserId"].ToString());

            var billQuality = false;

            string qualityTrim = qualityId.TrimEnd(',');
            string rateTrim = rate.TrimEnd(',');
            string rateNameTrim = rate_name.TrimEnd(',');
            List<string> qualityList = qualityTrim.Split(',').ToList();
            List<string> rateList = rateTrim.Split(',').ToList();
            List<string> rateNameList = rateNameTrim.Split(',').ToList();

            if (qualityList != null)
            {
                for (int i = 0; i < qualityList.Count; i++)
                {
                    billQuality = billDal.UpdateBillQuality(Convert.ToInt32(qualityList[i]), Convert.ToInt32(rateList[i]), rateNameList[i], userID);
                }
            }

            
            //billRequest.Status = Status;
            return Json(billQuality);
        }


        [HttpPost]
        public ActionResult SendBillComments(int MasterID, int ReviewTo, string ReviewMessage)
        {
            if (base.Session["SQuserId"] == null)
            {
                return base.RedirectToAction("Index", "Account");
            }
            int userID = Convert.ToInt32(base.Session["SQuserId"].ToString());
            return base.Json(this.billDal.BillCommentSent(MasterID, ReviewTo, ReviewMessage, userID), JsonRequestBehavior.AllowGet);
        }

        #endregion



    }
}