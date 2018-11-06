(ns imago-api.handler
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [clojure.java.jdbc :as sql]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]]))

; (Class/forName "com.mysql.jdbc.Driver")

(def db-spec
  {:classname "com.mysql.jdbc.Driver"
  :dbtype "mysql"
  :dbname "imago"
  :user "root"
  :password "root"})


(sql/query db-spec ["SELECT 3*5 AS result"])

(defroutes app-routes
  (GET "/" [] (sql/query db-spec ["SELECT 3*5 AS result"]))
  (route/not-found "Not Found"))  

(def app
  (wrap-defaults app-routes site-defaults))
