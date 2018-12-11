{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_GitPages (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\USER\\GitPages\\.stack-work\\install\\742f5a18\\bin"
libdir     = "C:\\Users\\USER\\GitPages\\.stack-work\\install\\742f5a18\\lib\\x86_64-windows-ghc-8.4.4\\GitPages-0.1.0.0-C1IFOJPqfYlKzZiwCdHk2L-site"
dynlibdir  = "C:\\Users\\USER\\GitPages\\.stack-work\\install\\742f5a18\\lib\\x86_64-windows-ghc-8.4.4"
datadir    = "C:\\Users\\USER\\GitPages\\.stack-work\\install\\742f5a18\\share\\x86_64-windows-ghc-8.4.4\\GitPages-0.1.0.0"
libexecdir = "C:\\Users\\USER\\GitPages\\.stack-work\\install\\742f5a18\\libexec\\x86_64-windows-ghc-8.4.4\\GitPages-0.1.0.0"
sysconfdir = "C:\\Users\\USER\\GitPages\\.stack-work\\install\\742f5a18\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "GitPages_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "GitPages_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "GitPages_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "GitPages_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "GitPages_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "GitPages_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
