//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NBA_Management_System.Entites
{
    using System;
    using System.Collections.Generic;
    
    public partial class MatchLog
    {
        public int IdMatch { get; set; }
        public int Quarter { get; set; }
        public string OccurTime { get; set; }
        public string Remark { get; set; }
        public int ActionType { get; set; }
        public int MatchId { get; set; }
        public int TeamId { get; set; }
        public int PlayerId { get; set; }
    
        public virtual ActionType ActionType1 { get; set; }
        public virtual Match Match { get; set; }
        public virtual Player Player { get; set; }
        public virtual Team Team { get; set; }
    }
}
