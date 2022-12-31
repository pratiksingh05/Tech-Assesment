import json

def extractValue(objj,keyy):
    vall = objj
    if(type(vall)==dict):
        for i in vall.keys():
            if keyy:
                key_i = keyy+"_"+i
            extractValue(vall[i],key_i) #recursively check dict object and get the exact value
    if(type(vall)!=dict):
        print("Output of nested json object - ", vall)
   

jsVal = {"a":{"b":{"c":"d"}}}
#jsVal = {"x":{"y":{"z":"a"}}}
#extractValue(jsVal,"x/y/z")
extractValue(jsVal,"a/b/c")