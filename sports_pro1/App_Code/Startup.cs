﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(sports_pro1.Startup))]
namespace sports_pro1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
