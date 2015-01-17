<?php
/**
 * autoload机制
 */
class auto_load {
    private static $_path;

    private function __construct()
    {
    }
    
    /**
     * 
     */
    private static function get_path()
    {
        if (!self::$_path) {
            self::$_path = dirname(__FILE__);
        }
        return self::$_path;
    }

    /**
     *自动加载
     */
    public static function load($class_name)
    {

        if (class_exists($class_name, false) || interface_exists($class_name, false)) {
             return true;
        }
        
        $file_name = self::get_path() . "/../action/" . $class_name . ".class.php";
        if (file_exists($file_name)) {
             require $file_name;
             return true;
        } else {
             return false;
        }
    }

}