.class public Lcom/muta/yanxi/view/activity/MemoriesActivity;
.super Lcom/muta/yanxi/base/b;
.source "SourceFile"


# instance fields
.field private Yr:Lcom/muta/yanxi/c/b/c;

.field anA:Lcom/muta/yanxi/a/h;

.field private anB:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private anC:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/muta/yanxi/entity/RecollectBean;",
            ">;"
        }
    .end annotation
.end field

.field private anD:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/muta/yanxi/entity/RecollectBean;",
            ">;"
        }
    .end annotation
.end field

.field private anE:Lcom/muta/yanxi/view/c/d;

.field private anF:Z

.field private anG:I

.field private showId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lcom/muta/yanxi/base/b;-><init>()V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anB:Ljava/util/List;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anC:Ljava/util/List;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anD:Ljava/util/List;

    .line 53
    iput v1, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->showId:I

    .line 57
    iput-boolean v1, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anF:Z

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MemoriesActivity;)I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anG:I

    return v0
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MemoriesActivity;I)I
    .locals 0

    .prologue
    .line 46
    iput p1, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anG:I

    return p1
.end method

.method public static a(Landroid/text/SpannableStringBuilder;Ljava/lang/String;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;
    .locals 2

    .prologue
    .line 189
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 192
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, p2, v0, v1, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 193
    return-object p0
.end method

.method public static am(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .prologue
    .line 61
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/muta/yanxi/view/activity/MemoriesActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 62
    return-object v0
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MemoriesActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anC:Ljava/util/List;

    return-object v0
.end method

.method static synthetic c(Lcom/muta/yanxi/view/activity/MemoriesActivity;)V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity;->qS()V

    return-void
.end method

.method static synthetic d(Lcom/muta/yanxi/view/activity/MemoriesActivity;)Lcom/muta/yanxi/view/c/d;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anE:Lcom/muta/yanxi/view/c/d;

    return-object v0
.end method

.method static synthetic e(Lcom/muta/yanxi/view/activity/MemoriesActivity;)Lcom/muta/yanxi/view/b/b;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    return-object v0
.end method

.method static synthetic f(Lcom/muta/yanxi/view/activity/MemoriesActivity;)Lcom/muta/yanxi/view/b/b;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    return-object v0
.end method

.method static synthetic g(Lcom/muta/yanxi/view/activity/MemoriesActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anB:Ljava/util/List;

    return-object v0
.end method

.method static synthetic h(Lcom/muta/yanxi/view/activity/MemoriesActivity;)Lcom/muta/yanxi/c/b/c;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    return-object v0
.end method

.method static synthetic i(Lcom/muta/yanxi/view/activity/MemoriesActivity;)V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity;->qU()V

    return-void
.end method

.method private qS()V
    .locals 4

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 146
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->abr:Lcom/muta/yanxi/widget/MutaTitleBar;

    invoke-virtual {v0, v2}, Lcom/muta/yanxi/widget/MutaTitleBar;->setAlpha(F)V

    .line 147
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adt:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 148
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adz:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 149
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adA:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 150
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adB:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 152
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adx:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    invoke-static {v0}, Lcom/muta/yanxi/e/a;->bb(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/muta/yanxi/e/a;->c(Landroid/content/Context;Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v0

    .line 153
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anE:Lcom/muta/yanxi/view/c/d;

    invoke-virtual {v1, v0}, Lcom/muta/yanxi/view/c/d;->cq(Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->abr:Lcom/muta/yanxi/widget/MutaTitleBar;

    invoke-virtual {v0, v3}, Lcom/muta/yanxi/widget/MutaTitleBar;->setAlpha(F)V

    .line 156
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adt:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 157
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adz:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 158
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adA:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 159
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adB:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 161
    return-void
.end method

.method private qT()V
    .locals 2

    .prologue
    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineMemories;->fill(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :offline_memories_network

    return-void

    :offline_memories_network

    .line 201
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/b/b;->show()V

    .line 202
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pJ()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$c;

    .line 203
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$c;

    .line 204
    invoke-interface {v0}, Lcom/muta/yanxi/presenter/a/d$c;->pM()Lrx/Observable;

    move-result-object v0

    .line 205
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 206
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 207
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesActivity$5;

    invoke-direct {v1, p0, p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity$5;-><init>(Lcom/muta/yanxi/view/activity/MemoriesActivity;Landroid/content/Context;)V

    .line 208
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 268
    return-void
.end method

.method private qU()V
    .locals 3

    .prologue
    .line 272
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adG:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anC:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->ady:Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anC:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;->setRecollectBeanList(Ljava/util/List;)V

    .line 275
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->ady:Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;

    const/4 v1, -0x6

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;->dG(I)Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;

    .line 277
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->ady:Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;->sS()V

    .line 279
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 67
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onCreate(Landroid/os/Bundle;)V

    .line 68
    const v0, 0x7f04002e

    invoke-static {p0, v0}, Landroid/a/e;->b(Landroid/app/Activity;I)Landroid/a/g;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/a/h;

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    .line 69
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/e;->a(Landroid/view/Window;)V

    .line 70
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity;->oy()V

    .line 72
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 178
    invoke-super {p0}, Lcom/muta/yanxi/base/b;->onPause()V

    .line 179
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 173
    invoke-super {p0}, Lcom/muta/yanxi/base/b;->onResume()V

    .line 174
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 183
    invoke-super {p0}, Lcom/muta/yanxi/base/b;->onStop()V

    .line 186
    return-void
.end method

.method protected oo()V
    .locals 3

    .prologue
    .line 76
    const-string v0, "memory"

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->aaT:Ljava/lang/String;

    .line 77
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    invoke-static {v0}, Lcom/muta/yanxi/c/b/c;->aa(Landroid/content/Context;)Lcom/muta/yanxi/c/b/c;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    .line 79
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    const-string v1, "Headimg"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/muta/yanxi/c/b/c;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 80
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v1, v1, Lcom/muta/yanxi/a/h;->adL:Landroid/widget/ImageView;

    invoke-static {p0, v1, v0}, Lcom/muta/yanxi/e/i;->a(Landroid/content/Context;Landroid/widget/ImageView;Ljava/lang/String;)V

    .line 81
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity;->qT()V

    .line 82
    return-void
.end method

.method protected ov()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 165
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adz:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 166
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adA:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 167
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adB:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 168
    new-instance v0, Lcom/muta/yanxi/view/c/d;

    invoke-direct {v0, p0}, Lcom/muta/yanxi/view/c/d;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anE:Lcom/muta/yanxi/view/c/d;

    .line 169
    return-void
.end method

.method protected ow()V
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->abr:Lcom/muta/yanxi/widget/MutaTitleBar;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesActivity$1;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity$1;-><init>(Lcom/muta/yanxi/view/activity/MemoriesActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/MutaTitleBar;->setLeftLayoutClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->ady:Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesActivity$2;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity$2;-><init>(Lcom/muta/yanxi/view/activity/MemoriesActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/carrousellayout/RotationViewLayout;->setRecollerOnTouchEvent(Lcom/muta/yanxi/widget/carrousellayout/a;)V

    .line 121
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anA:Lcom/muta/yanxi/a/h;

    iget-object v0, v0, Lcom/muta/yanxi/a/h;->adt:Landroid/widget/ImageButton;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesActivity$3;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity$3;-><init>(Lcom/muta/yanxi/view/activity/MemoriesActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesActivity;->anE:Lcom/muta/yanxi/view/c/d;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesActivity$4;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesActivity$4;-><init>(Lcom/muta/yanxi/view/activity/MemoriesActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/c/d;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 137
    return-void
.end method

.method protected ox()V
    .locals 0

    .prologue
    .line 142
    return-void
.end method
