```python
def clean_text(txt: str):
    # xu li chuoi rong
    if pd.isna(txt):
        txt = ''
    # loai bo cac ki tu dac biet nhu emoij
    txt = re.sub(r'[^\w\s!.,?]', ' ', txt)
    # xu li khoang trang thua
    txt = re.sub(r'\s+', ' ', txt)
    return txt.strip().lower()
```