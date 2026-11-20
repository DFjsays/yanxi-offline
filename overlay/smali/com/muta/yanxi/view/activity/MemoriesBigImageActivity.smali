.class public Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;
.super Lcom/muta/yanxi/base/b;
.source "SourceFile"


# instance fields
.field anI:Lcom/muta/yanxi/a/w;

.field private anJ:Lcom/muta/yanxi/e/a/b;

.field private anK:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/muta/yanxi/base/b;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;)V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->qV()V

    return-void
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anK:Ljava/lang/String;

    return-object v0
.end method

.method public static b(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 35
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 36
    const-string v1, "path"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 37
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 38
    return-void
.end method

.method static synthetic c(Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;)Lcom/muta/yanxi/e/a/b;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anJ:Lcom/muta/yanxi/e/a/b;

    return-object v0
.end method

.method private qV()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 106
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v1, v0, v3

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$4;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$4;-><init>(Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;)V

    invoke-static {p0, v3, v0, v1}, Lcom/muta/yanxi/e/c/b;->a(Landroid/content/Context;I[Ljava/lang/String;Lcom/muta/yanxi/e/c/b$a;)V

    .line 123
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onCreate(Landroid/os/Bundle;)V

    .line 43
    const v0, 0x7f04003f

    invoke-static {p0, v0}, Landroid/a/e;->b(Landroid/app/Activity;I)Landroid/a/g;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/a/w;

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anI:Lcom/muta/yanxi/a/w;

    .line 44
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/e;->a(Landroid/view/Window;)V

    .line 45
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->oy()V

    .line 47
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .prologue
    .line 128
    invoke-static {p1, p2, p3}, Lcom/muta/yanxi/e/c/b;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 129
    invoke-super {p0, p1, p2, p3}, Lcom/muta/yanxi/base/b;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 130
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .prologue
    .line 50
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onWindowFocusChanged(Z)V

    .line 51
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/e;->c(Landroid/view/Window;)V

    .line 52
    return-void
.end method

.method protected oo()V
    .locals 0

    .prologue
    .line 56
    return-void
.end method

.method protected ov()V
    .locals 2

    .prologue
    .line 60
    new-instance v0, Lcom/muta/yanxi/e/a/b;

    invoke-direct {v0, p0}, Lcom/muta/yanxi/e/a/b;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anJ:Lcom/muta/yanxi/e/a/b;

    .line 61
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "path"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "path"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anK:Ljava/lang/String;

    .line 63
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anI:Lcom/muta/yanxi/a/w;

    iget-object v0, v0, Lcom/muta/yanxi/a/w;->aeI:Lcom/muta/yanxi/widget/photoview/EasePhotoView;

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anK:Ljava/lang/String;

    invoke-static {v0}, Lcom/muta/yanxi/offline/OfflineMemories;->loadCg(Landroid/widget/ImageView;)V

    .line 66
    :cond_0
    return-void
.end method

.method protected ow()V
    .locals 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anI:Lcom/muta/yanxi/a/w;

    iget-object v0, v0, Lcom/muta/yanxi/a/w;->abr:Lcom/muta/yanxi/widget/MutaTitleBar;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$1;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$1;-><init>(Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/MutaTitleBar;->setLeftLayoutClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anI:Lcom/muta/yanxi/a/w;

    iget-object v0, v0, Lcom/muta/yanxi/a/w;->adt:Landroid/widget/ImageButton;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$2;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$2;-><init>(Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;->anJ:Lcom/muta/yanxi/e/a/b;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$3;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity$3;-><init>(Lcom/muta/yanxi/view/activity/MemoriesBigImageActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/e/a/b;->a(Lcom/muta/yanxi/e/a/d;)V

    .line 97
    return-void
.end method

.method protected ox()V
    .locals 0

    .prologue
    .line 102
    return-void
.end method
