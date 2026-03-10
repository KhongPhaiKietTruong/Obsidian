dictionary là một iterable chứa từng cặp key và value
key của dictionary là immutable
## Operations with dict
- to get a value of a key, use get(key_name)
- to get a list of key, use keys()
- to get a list of values, use values()
- get elements of dict with type of typle, use items()
- 
- print(mydict\['name']) # Tran
- print(mydict.get('age')) # 37
- print(mydict.keys()) # dict_keys(\['name', 'age', 'country'])
- print(mydict.values()) # dict_values(\['Tran', 37, 'Vietnam’])
- print(mydict.items()) # dict_items(\[('name','Tran'), ('age',37), ('country','Vietnam')])

- to update a value of a key, use update() or key_name
- mydict\['name'] = 'Quang’
- mydict.update({'name':'Quang'})

- to  delete a key, use pop(key_name)

- Lấy key_name:
• for key in mydict: print(key)
• for key in mydict.keys(): print(key)
• Lấy value:
• for key in mydict: print(mydict[key])
• for x in mydict.values(): print(x)
• Lấy giá trị (key : value):
• for key, value in mydict.items(): print(key, value)