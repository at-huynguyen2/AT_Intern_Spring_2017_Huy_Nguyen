require 'nokogiri'
require 'open-uri'
require 'pry'
require './openuri'
require './dbconfig'
require './io'
require './exportfile'

$combineArr = getDataToHash
arr = sortByResult $combineArr if $combineArr != nil
# inputListToDB arr
exportfile arr if arr!=nil
