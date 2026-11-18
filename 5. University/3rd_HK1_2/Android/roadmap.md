To get a high grade in **Mobile Programming**, I recommend focusing on two things:
1. **Master Android development fundamentals** so you can handle theoretical and practical exams.
2. **Build a complete Android application** that demonstrates your ability to develop a real product.
Since your course uses **Android Studio + Kotlin**, here is the learning roadmap I recommend.
# **1. Kotlin programming fundamentals**
You should be comfortable with Kotlin before diving deeply into Android.

|Topic|What you need to know|Priority|
|---|---|---|
|Variables|`val`, `var`, data types|High|
|Null safety|`?`, `!!`, `?:`, `?.`|Very high|
|Control flow|`if`, `when`, loops|High|
|Functions|Parameters, return types, lambda|High|
|OOP|Class, object, inheritance, interface|Very high|
|Data class|`data class`, `copy()`|High|
|Collections|List, MutableList, Map, Set|High|
|Higher-order functions|`map`, `filter`, `forEach`|Medium|
|Coroutines|`suspend`, `launch`, `async`|Medium|

**Particularly important:** OOP and null safety. Android development uses these concepts extensively.

# **2. Android fundamentals**

Very high priority

This is probably the most important section of the course.

[Activity and Its Lifecycle in Android](https://images.openai.com/static-rsc-4/r7aOWSqA6OPchk_WvScCWGSIJZ70k4Il5azIr_-JQUQ6FAE3gLvxNoJvUubqumqpbJyvYTB3w_S_T6R0CtFvf2hqeivo6MaJwgiykgpcv4vE094E8yeJWvvAc_DgsAMXGgGVba_6niLPbL0T1LWxT04FkeTgV0naVqPKo53wCX4?purpose=inline)

**2.1. Activity and Activity Lifecycle**

- What is an Activity?
    
- `onCreate()`, `onStart()`, `onResume()`
    
- `onPause()`, `onStop()`, `onDestroy()`
    
- Activity lifecycle and state management.
    

[検索画面レイアウト作成 | Android programing getstart](https://images.openai.com/static-rsc-4/qNh0P1_MXAUysCgUnSnVj2arhy70QfJdHY8lfIh1OL0rHJwDcQzH6V6AJn-CQACSMY9wxLMxHYIMAZxHzbu2xMPgogX9AugXWQctB0PIB-aGyuQYM69uqrm8fspeXpdZ5KY1u9DufXztflirKXE8tuzXoRMRQfNsNf5JMGoSW7I?purpose=inline)

**2.2. UI Development**

- XML layouts
    
- LinearLayout, ConstraintLayout, FrameLayout
    
- TextView, EditText, Button, ImageView
    
- RecyclerView and Adapter
    
- Event handling and click listeners.
    

[Android development session 2 - intent and activity | PPTX](https://images.openai.com/static-rsc-4/kk4nhAoDki-naMPFbq2yguANUWGjb2Z6kTbvmtYsT8wsB7MHzGRxlgG4a4PCkNKIsSsxiZCoqjabrqi-lM232iQEvtGKtGxbJSPoDVH9X3fkBRDXxKt5Bgx_P1h8Mv3qK9vft1-6ChnEwyRGyywgmzdyB_ml55uRoRnecGhszoQ?purpose=inline)

**2.3. Intent and Navigation**

- Explicit Intent and Implicit Intent
    
- Passing data between Activities
    
- Bundle and Parcelable
    
- Activity navigation
    

[Taxonomy of android manifest. | Download Scientific Diagram](https://images.openai.com/static-rsc-4/ZRZNCn7agsPNkMGD88mTvtBzlaLDANVcflQghtG-xE6Jj9QInPqSnXUoMj4YcbD1YNgol7f1mxL-NzUXjI0QIzTPR_luEeRyqgnx5m5kFZYTIYuw-Sp6zAsQtQSbolkB6jOcFuRuI2vlYHqRRF0aVqnDE3O-23TM8Aa4iPuF0TU?purpose=inline)

**2.4. Android Manifest and Permissions**

- AndroidManifest.xml
    
- Application components
    
- Runtime permissions
    
- Camera, Internet, Location permissions.
    

# **3. Data storage**

Very high priority

You should understand how an Android application stores and retrieves data.

|Technology|Purpose|
|---|---|
|SharedPreferences / DataStore|Store simple key-value data|
|SQLite|Local relational database|
|Room|Abstraction layer over SQLite|
|Firebase Firestore|Cloud NoSQL database|
|Firebase Authentication|User authentication|

You should be able to implement CRUD:

- **Create:** Insert data.
    
- **Read:** Retrieve data.
    
- **Update:** Modify data.
    
- **Delete:** Remove data.
    

For example, build a student management application with:

- Add student.
    
- Display student list.
    
- Edit student information.
    
- Delete student.
    
- Search students.
    

# **4. Networking and APIs**

This section helps you move from simple applications to real applications.

Learn:

- HTTP and REST API.
    
- GET, POST, PUT, DELETE.
    
- JSON serialization/deserialization.
    
- Retrofit.
    
- Kotlin Coroutines.
    
- Handling network errors.
    

Example architecture:

**Android UI**

Activity / Fragment

**ViewModel / Repository**

**Retrofit / API Service**

**Remote Server / Database**

# **5. Software architecture**

This is useful for writing clean code and building a good final project.

Focus on:

- MVC and MVVM.
    
- ViewModel.
    
- LiveData / StateFlow.
    
- Repository Pattern.
    
- Separation of concerns.
    
- Dependency Injection (basic understanding).