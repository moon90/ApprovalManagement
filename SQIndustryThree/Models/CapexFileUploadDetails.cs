﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SQIndustryThree.Models
{
    public class CapexFileUploadDetails
    {
        public int CapexFileUploadId { get; set; }
        public string CapexFileName { get; set; }
        public string CapexFilePath { get; set; }
        public int CapexInfoId { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
    }
}