﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace NBA_Management_System
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Entites.BasketballSystemEntities3 Context { get; } = new Entites.BasketballSystemEntities3();
        public static Entites.User currentUser = null;
    }
}
