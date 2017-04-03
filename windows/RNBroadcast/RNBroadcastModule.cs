using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Com.Reactlibrary.RNBroadcast
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNBroadcastModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNBroadcastModule"/>.
        /// </summary>
        internal RNBroadcastModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNBroadcast";
            }
        }
    }
}
