.class public Lcom/muta/yanxi/view/c/a;
.super Landroid/widget/PopupWindow;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/muta/yanxi/view/c/a$a;,
        Lcom/muta/yanxi/view/c/a$b;
    }
.end annotation


# instance fields
.field private Ys:Lcom/muta/yanxi/c/b/b;

.field protected aaD:Landroid/widget/ListView;

.field protected aau:Lcom/hyphenate/chat/EMConversation;

.field private ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

.field private ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

.field protected alL:I

.field protected alj:Ljava/lang/String;

.field private arh:Lme/iwf/photopicker/d/c;

.field private ari:Landroid/view/inputmethod/InputMethodManager;

.field private arn:I

.field private arp:[I

.field private arr:[I

.field private ars:Z

.field private asf:Lcom/muta/yanxi/base/b;

.field private asg:Landroid/view/LayoutInflater;

.field private ash:Landroid/view/View;

.field private asi:Landroid/widget/LinearLayout;

.field private asj:Landroid/widget/ImageView;

.field private ask:Landroid/widget/RelativeLayout;

.field private asl:Landroid/widget/RelativeLayout;

.field protected asm:Ljava/lang/String;

.field private asn:I

.field private aso:[I

.field private asp:[I

.field private asq:[I

.field private asr:[I

.field private ass:Lcom/muta/yanxi/view/c/a$b;

.field private ast:Z

.field asu:Lcom/hyphenate/EMMessageListener;

.field private asv:Ljava/lang/String;

.field private asw:Lcom/muta/yanxi/entity/AiDebugMessage;

.field private asx:I

.field private asy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/muta/yanxi/entity/AIAnswer;",
            ">;"
        }
    .end annotation
.end field

.field private asz:Lcom/muta/yanxi/view/c/a$a;

.field protected handler:Landroid/os/Handler;

.field private isDebug:Z

.field private keyHeight:I


# direct methods
.method public constructor <init>(Lcom/muta/yanxi/base/b;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v1, 0x4

    .line 141
    invoke-direct {p0, p1}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    .line 93
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->handler:Landroid/os/Handler;

    .line 95
    const/16 v0, 0x14

    iput v0, p0, Lcom/muta/yanxi/view/c/a;->arn:I

    .line 111
    iput v3, p0, Lcom/muta/yanxi/view/c/a;->asn:I

    .line 113
    iput v3, p0, Lcom/muta/yanxi/view/c/a;->keyHeight:I

    .line 115
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->arp:[I

    .line 116
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->aso:[I

    .line 117
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asp:[I

    .line 119
    new-array v0, v1, [I

    fill-array-data v0, :array_3

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asq:[I

    .line 121
    new-array v0, v1, [I

    fill-array-data v0, :array_4

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asr:[I

    .line 124
    new-array v0, v1, [I

    fill-array-data v0, :array_5

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->arr:[I

    .line 128
    iput-boolean v3, p0, Lcom/muta/yanxi/view/c/a;->isDebug:Z

    .line 129
    iput-boolean v3, p0, Lcom/muta/yanxi/view/c/a;->ast:Z

    .line 132
    const-string v0, ""

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    .line 136
    iput v3, p0, Lcom/muta/yanxi/view/c/a;->asx:I

    .line 138
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    .line 142
    iput-object p1, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    .line 143
    iput v1, p0, Lcom/muta/yanxi/view/c/a;->alL:I

    .line 144
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nG()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asm:Ljava/lang/String;

    .line 145
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->alj:Ljava/lang/String;

    .line 146
    const-string v0, "layout_inflater"

    .line 147
    invoke-virtual {p1, v0}, Lcom/muta/yanxi/base/b;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asg:Landroid/view/LayoutInflater;

    .line 148
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asg:Landroid/view/LayoutInflater;

    const v1, 0x7f0400d0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    .line 149
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    const v1, 0x7f1002fb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asl:Landroid/widget/RelativeLayout;

    .line 150
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    const v1, 0x7f1002fd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asi:Landroid/widget/LinearLayout;

    .line 151
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    const v1, 0x7f1002fc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asj:Landroid/widget/ImageView;

    .line 152
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    const v1, 0x7f1000d2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->ask:Landroid/widget/RelativeLayout;

    .line 153
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    const v1, 0x7f1001fe

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    .line 154
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    const v1, 0x7f1001fd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    .line 156
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ash:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->setContentView(Landroid/view/View;)V

    .line 158
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->setWidth(I)V

    .line 160
    const/4 v0, -0x2

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->setHeight(I)V

    .line 162
    invoke-virtual {p0, v4}, Lcom/muta/yanxi/view/c/a;->setFocusable(Z)V

    .line 164
    const v0, 0x7f0c00a3

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->setAnimationStyle(I)V

    .line 166
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 168
    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 171
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-static {v0}, Lcom/muta/yanxi/c/b/b;->Z(Landroid/content/Context;)Lcom/muta/yanxi/c/b/b;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->Ys:Lcom/muta/yanxi/c/b/b;

    .line 173
    invoke-virtual {p0, v4}, Lcom/muta/yanxi/view/c/a;->setInputMethodMode(I)V

    .line 174
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->setSoftInputMode(I)V

    .line 175
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->ov()V

    .line 177
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->rV()V

    .line 179
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/base/b;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/muta/yanxi/view/c/a;->asn:I

    .line 181
    iget v0, p0, Lcom/muta/yanxi/view/c/a;->asn:I

    div-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/muta/yanxi/view/c/a;->keyHeight:I

    .line 183
    new-instance v0, Lme/iwf/photopicker/d/c;

    invoke-direct {v0, p1}, Lme/iwf/photopicker/d/c;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->arh:Lme/iwf/photopicker/d/c;

    .line 185
    return-void

    .line 115
    :array_0
    .array-data 4
        0x7f090263
        0x7f090267
        0x7f090253
        0x7f090265
    .end array-data

    .line 116
    :array_1
    .array-data 4
        0x7f090263
        0x7f090267
        0x7f090257
        0x7f090265
    .end array-data

    .line 117
    :array_2
    .array-data 4
        0x7f020093
        0x7f020097
        0x7f020098
        0x7f020099
    .end array-data

    .line 119
    :array_3
    .array-data 4
        0x7f020093
        0x7f020097
        0x7f020095
        0x7f020099
    .end array-data

    .line 121
    :array_4
    .array-data 4
        0x7f020093
        0x7f020097
        0x7f020096
        0x7f020099
    .end array-data

    .line 124
    :array_5
    .array-data 4
        0x1
        0x2
        0x5
        0x6
    .end array-data
.end method

.method static synthetic a(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic a(Lcom/muta/yanxi/view/c/a;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->rX()V

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/c/a;Z)Z
    .locals 0

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/muta/yanxi/view/c/a;->isDebug:Z

    return p1
.end method

.method static synthetic b(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/c/a;->co(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic b(Lcom/muta/yanxi/view/c/a;)Z
    .locals 1

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->isDebug:Z

    return v0
.end method

.method static synthetic c(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/entity/AiDebugMessage;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    return-object v0
.end method

.method static synthetic c(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/c/a;->cp(Ljava/lang/String;)V

    return-void
.end method

.method private cc(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 656
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/c/a;->co(Ljava/lang/String;)V

    .line 658
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pI()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$h;

    .line 659
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$h;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->alj:Ljava/lang/String;

    const/4 v3, 0x1

    .line 660
    invoke-interface {v0, v1, v2, v3, p1}, Lcom/muta/yanxi/presenter/a/d$h;->a(ILjava/lang/String;ILjava/lang/String;)Lrx/Observable;

    move-result-object v0

    .line 661
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    .line 662
    invoke-virtual {v1}, Lcom/muta/yanxi/base/b;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 663
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/c/a$6;

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-direct {v1, p0, v2}, Lcom/muta/yanxi/view/c/a$6;-><init>(Lcom/muta/yanxi/view/c/a;Landroid/content/Context;)V

    .line 664
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 690
    return-void
.end method

.method private cn(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 614
    new-instance v0, Lcom/muta/yanxi/entity/AIAnswer;

    invoke-direct {v0}, Lcom/muta/yanxi/entity/AIAnswer;-><init>()V

    .line 615
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/entity/AIAnswer;->setType(I)V

    .line 616
    invoke-virtual {v0, p1}, Lcom/muta/yanxi/entity/AIAnswer;->setContent(Ljava/lang/String;)V

    .line 617
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    .line 618
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 623
    :goto_0
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/c/a;->co(Ljava/lang/String;)V

    .line 625
    return-void

    .line 620
    :cond_0
    const-string v0, "\u4e00\u6b21\u6027\u8981\u5b66\u8fd9\u4e48\u591a\u597d\u96be\u554a\uff0c\u8bf7\u4e0d\u8981\u53d1\u8d85\u8fc73\u6761\u8c03\u6559\u6d88\u606f\u3002"

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/c/a;->cp(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private co(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 628
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asm:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/hyphenate/chat/EMMessage;->createTxtSendMessage(Ljava/lang/String;Ljava/lang/String;)Lcom/hyphenate/chat/EMMessage;

    move-result-object v0

    .line 629
    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->sendMessage(Lcom/hyphenate/chat/EMMessage;)V

    .line 630
    return-void
.end method

.method private cp(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 633
    if-nez p1, :cond_0

    .line 639
    :goto_0
    return-void

    .line 637
    :cond_0
    invoke-static {}, Lcom/muta/yanxi/b;->nL()Lcom/muta/yanxi/b;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/muta/yanxi/b;->aK(Ljava/lang/String;)V

    .line 638
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;->op()V

    goto :goto_0
.end method

.method static synthetic d(Lcom/muta/yanxi/view/c/a;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic d(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/c/a;->cn(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic e(Lcom/muta/yanxi/view/c/a;)Ljava/util/List;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    return-object v0
.end method

.method static synthetic e(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/c/a;->cc(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic f(Lcom/muta/yanxi/view/c/a;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->sa()V

    return-void
.end method

.method static synthetic g(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    return-object v0
.end method

.method static synthetic h(Lcom/muta/yanxi/view/c/a;)Z
    .locals 1

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->ast:Z

    return v0
.end method

.method static synthetic i(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    return-object v0
.end method

.method static synthetic j(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/base/b;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    return-object v0
.end method

.method static synthetic k(Lcom/muta/yanxi/view/c/a;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->rO()V

    return-void
.end method

.method static synthetic l(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/c/b/b;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->Ys:Lcom/muta/yanxi/c/b/b;

    return-object v0
.end method

.method static synthetic m(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/view/c/a$a;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asz:Lcom/muta/yanxi/view/c/a$a;

    return-object v0
.end method

.method private ov()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 188
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->q(Ljava/util/List;)V

    .line 189
    new-instance v0, Lcom/muta/yanxi/view/c/a$b;

    invoke-direct {v0, p0, v1}, Lcom/muta/yanxi/view/c/a$b;-><init>(Lcom/muta/yanxi/view/c/a;Lcom/muta/yanxi/view/c/a$1;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->ass:Lcom/muta/yanxi/view/c/a$b;

    .line 190
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asl:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 192
    iget v0, p0, Lcom/muta/yanxi/view/c/a;->alL:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 193
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;->setShowUserNick(Z)V

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->aaD:Landroid/widget/ListView;

    .line 195
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asi:Landroid/widget/LinearLayout;

    new-instance v1, Lcom/muta/yanxi/view/c/a$1;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/c/a$1;-><init>(Lcom/muta/yanxi/view/c/a;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    new-instance v1, Lcom/muta/yanxi/view/c/a$2;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/c/a$2;-><init>(Lcom/muta/yanxi/view/c/a;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->setChatInputMenuListener(Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu$a;)V

    .line 261
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/base/b;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->ari:Landroid/view/inputmethod/InputMethodManager;

    .line 263
    invoke-virtual {p0}, Lcom/muta/yanxi/view/c/a;->rU()V

    .line 265
    return-void
.end method

.method private rJ()V
    .locals 5

    .prologue
    return-void

    const/4 v2, 0x0

    .line 274
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v0

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asm:Ljava/lang/String;

    iget v3, p0, Lcom/muta/yanxi/view/c/a;->alL:I

    invoke-static {v3}, Lcom/muta/yanxi/e/b;->dp(I)Lcom/hyphenate/chat/EMConversation$EMConversationType;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v3, v4}, Lcom/hyphenate/chat/EMChatManager;->getConversation(Ljava/lang/String;Lcom/hyphenate/chat/EMConversation$EMConversationType;Z)Lcom/hyphenate/chat/EMConversation;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->aau:Lcom/hyphenate/chat/EMConversation;

    .line 275
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->aau:Lcom/hyphenate/chat/EMConversation;

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMConversation;->markAllMessagesAsRead()V

    .line 278
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->aau:Lcom/hyphenate/chat/EMConversation;

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMConversation;->getAllMessages()Ljava/util/List;

    move-result-object v3

    .line 279
    if-eqz v3, :cond_2

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    move v1, v0

    .line 280
    :goto_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->aau:Lcom/hyphenate/chat/EMConversation;

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMConversation;->getAllMsgCount()I

    move-result v0

    if-ge v1, v0, :cond_1

    iget v0, p0, Lcom/muta/yanxi/view/c/a;->arn:I

    if-ge v1, v0, :cond_1

    .line 281
    const/4 v0, 0x0

    .line 282
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 283
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hyphenate/chat/EMMessage;

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMMessage;->getMsgId()Ljava/lang/String;

    move-result-object v0

    .line 285
    :cond_0
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->aau:Lcom/hyphenate/chat/EMConversation;

    iget v3, p0, Lcom/muta/yanxi/view/c/a;->arn:I

    sub-int v1, v3, v1

    invoke-virtual {v2, v0, v1}, Lcom/hyphenate/chat/EMConversation;->loadMoreMsgFromDB(Ljava/lang/String;I)Ljava/util/List;

    .line 288
    :cond_1
    return-void

    :cond_2
    move v1, v2

    .line 279
    goto :goto_0
.end method

.method private rK()V
    .locals 4

    .prologue
    return-void

    .line 292
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asm:Ljava/lang/String;

    iget v2, p0, Lcom/muta/yanxi/view/c/a;->alL:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;->a(Ljava/lang/String;ILcom/muta/yanxi/widget/ai_widget/chatrow/a;)V

    .line 294
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;->getListView()Landroid/widget/ListView;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/c/a$3;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/c/a$3;-><init>(Lcom/muta/yanxi/view/c/a;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 305
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->ars:Z

    .line 306
    return-void
.end method

.method private rO()V
    .locals 3

    .prologue
    .line 760
    :try_start_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->arh:Lme/iwf/photopicker/d/c;

    invoke-virtual {v0}, Lme/iwf/photopicker/d/c;->wN()Landroid/content/Intent;

    move-result-object v0

    .line 761
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/muta/yanxi/base/b;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 768
    :goto_0
    return-void

    .line 762
    :catch_0
    move-exception v0

    .line 763
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 764
    :catch_1
    move-exception v0

    .line 766
    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method private rV()V
    .locals 2

    .prologue
    return-void

    .line 311
    new-instance v0, Lcom/muta/yanxi/view/c/a$4;

    invoke-direct {v0, p0}, Lcom/muta/yanxi/view/c/a$4;-><init>(Lcom/muta/yanxi/view/c/a;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asu:Lcom/hyphenate/EMMessageListener;

    .line 361
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v0

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asu:Lcom/hyphenate/EMMessageListener;

    invoke-virtual {v0, v1}, Lcom/hyphenate/chat/EMChatManager;->addMessageListener(Lcom/hyphenate/EMMessageListener;)V

    .line 363
    return-void
.end method

.method private rX()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 530
    iget-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->isDebug:Z

    if-eqz v0, :cond_0

    .line 531
    const-string v0, "\u8c03\u6559\u6a21\u5f0f\u5173\u95ed..."

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/c/a;->cp(Ljava/lang/String;)V

    .line 533
    :cond_0
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->rZ()V

    .line 534
    invoke-virtual {p0}, Lcom/muta/yanxi/view/c/a;->dismiss()V

    .line 535
    return-void
.end method

.method private rZ()V
    .locals 1

    .prologue
    .line 552
    const-string v0, ""

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    .line 553
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 554
    const/4 v0, 0x0

    iput v0, p0, Lcom/muta/yanxi/view/c/a;->asx:I

    .line 555
    return-void
.end method

.method private sa()V
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 559
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 560
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 561
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    invoke-virtual {v2, v0}, Lcom/muta/yanxi/entity/AiDebugMessage;->setType(I)V

    .line 562
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/muta/yanxi/entity/AiDebugMessage;->setCharacter_id(I)V

    .line 563
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    iget-object v3, p0, Lcom/muta/yanxi/view/c/a;->alj:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/muta/yanxi/entity/AiDebugMessage;->setUser_name(Ljava/lang/String;)V

    .line 564
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    iget-object v3, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/muta/yanxi/entity/AiDebugMessage;->setAnswerList(Ljava/util/List;)V

    .line 565
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    invoke-virtual {v2, v1}, Lcom/muta/yanxi/entity/AiDebugMessage;->setCount_answer(I)V

    .line 567
    :cond_0
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 568
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    move v1, v0

    .line 569
    :goto_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    .line 570
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "answer"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/entity/AIAnswer;

    invoke-virtual {v0}, Lcom/muta/yanxi/entity/AIAnswer;->getContent()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "type"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/entity/AIAnswer;

    invoke-virtual {v0}, Lcom/muta/yanxi/entity/AIAnswer;->getType()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v7, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 574
    :cond_1
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->rZ()V

    .line 575
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pI()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$h;

    .line 576
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$h;

    iget v1, p0, Lcom/muta/yanxi/view/c/a;->asx:I

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->alj:Ljava/lang/String;

    iget-object v3, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    .line 577
    invoke-virtual {v3}, Lcom/muta/yanxi/entity/AiDebugMessage;->getCharacter_id()I

    move-result v3

    iget-object v4, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    invoke-virtual {v4}, Lcom/muta/yanxi/entity/AiDebugMessage;->getContent()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    .line 578
    invoke-virtual {v5}, Lcom/muta/yanxi/entity/AiDebugMessage;->getCount_answer()I

    move-result v5

    .line 577
    invoke-interface/range {v0 .. v7}, Lcom/muta/yanxi/presenter/a/d$h;->a(ILjava/lang/String;ILjava/lang/String;ILjava/util/Map;Ljava/util/Map;)Lrx/Observable;

    move-result-object v0

    .line 580
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    .line 581
    invoke-virtual {v1}, Lcom/muta/yanxi/base/b;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 582
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/c/a$5;

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-direct {v1, p0, v2}, Lcom/muta/yanxi/view/c/a$5;-><init>(Lcom/muta/yanxi/view/c/a;Landroid/content/Context;)V

    .line 583
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 609
    return-void
.end method


# virtual methods
.method public a(Lcom/muta/yanxi/view/c/a$a;)V
    .locals 0

    .prologue
    .line 790
    iput-object p1, p0, Lcom/muta/yanxi/view/c/a;->asz:Lcom/muta/yanxi/view/c/a$a;

    .line 791
    return-void
.end method

.method protected ce(Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x1

    .line 694
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-static {v0, v7, v1, v1}, Lcom/muta/yanxi/e/h;->a(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 696
    sget v2, Lcom/muta/yanxi/e/h;->akK:F

    sget v3, Lcom/muta/yanxi/e/h;->akK:F

    const/16 v4, 0xc8

    move-object v0, p1

    move v6, v5

    invoke-static/range {v0 .. v6}, Lcom/muta/yanxi/e/h;->a(Ljava/lang/String;Ljava/lang/String;FFIZZ)Landroid/graphics/Bitmap;

    .line 698
    invoke-static {v1}, Lcom/muta/yanxi/e/h;->bt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 699
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asm:Ljava/lang/String;

    invoke-static {p1, v5, v0}, Lcom/hyphenate/chat/EMMessage;->createImageSendMessage(Ljava/lang/String;ZLjava/lang/String;)Lcom/hyphenate/chat/EMMessage;

    move-result-object v0

    .line 700
    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->sendMessage(Lcom/hyphenate/chat/EMMessage;)V

    .line 702
    iget-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->isDebug:Z

    if-eqz v0, :cond_3

    .line 703
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, ""

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 704
    :cond_0
    const-string v0, "\u8c03\u6559\u6a21\u5f0f\u5f00\u542f...,\u8bf7\u8f93\u5165\u95ee\u9898\uff0c\u7ed3\u675f\u8bf7\u5728\u6309\u4e00\u6b21\u8c03\u6559\u6309\u94ae\u3002"

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/c/a;->cp(Ljava/lang/String;)V

    .line 756
    :goto_0
    return-void

    .line 706
    :cond_1
    iput v7, p0, Lcom/muta/yanxi/view/c/a;->asx:I

    .line 708
    new-instance v0, Lcom/muta/yanxi/entity/AIAnswer;

    invoke-direct {v0}, Lcom/muta/yanxi/entity/AIAnswer;-><init>()V

    .line 709
    invoke-virtual {v0, v7}, Lcom/muta/yanxi/entity/AIAnswer;->setType(I)V

    .line 710
    invoke-virtual {v0, v1}, Lcom/muta/yanxi/entity/AIAnswer;->setContent(Ljava/lang/String;)V

    .line 711
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x3

    if-ge v1, v2, :cond_2

    .line 712
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asy:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 714
    :cond_2
    const-string v0, "\u4e00\u6b21\u6027\u8981\u5b66\u8fd9\u4e48\u591a\u597d\u96be\u554a\uff0c\u8bf7\u4e0d\u8981\u53d1\u8d85\u8fc73\u6761\u8c03\u6559\u6d88\u606f\u3002"

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/c/a;->cp(Ljava/lang/String;)V

    goto :goto_0

    .line 721
    :cond_3
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pI()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v2, Lcom/muta/yanxi/presenter/a/d$h;

    .line 722
    invoke-virtual {v0, v2}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$h;

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->alj:Ljava/lang/String;

    .line 723
    invoke-interface {v0, v7, v2, v7, v1}, Lcom/muta/yanxi/presenter/a/d$h;->a(ILjava/lang/String;ILjava/lang/String;)Lrx/Observable;

    move-result-object v0

    .line 724
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    .line 725
    invoke-virtual {v1}, Lcom/muta/yanxi/base/b;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 726
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/c/a$7;

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-direct {v1, p0, v2}, Lcom/muta/yanxi/view/c/a$7;-><init>(Lcom/muta/yanxi/view/c/a;Landroid/content/Context;)V

    .line 727
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    goto :goto_0
.end method

.method public m(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 782
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 783
    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->ce(Ljava/lang/String;)V

    .line 785
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 4

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 446
    if-eqz p9, :cond_1

    if-eqz p5, :cond_1

    sub-int v0, p9, p5

    iget v1, p0, Lcom/muta/yanxi/view/c/a;->keyHeight:I

    if-le v0, v1, :cond_1

    .line 447
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->ast:Z

    .line 449
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ask:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 450
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->aaD:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAlpha(F)V

    .line 451
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asj:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 460
    :cond_0
    :goto_0
    return-void

    .line 452
    :cond_1
    if-eqz p9, :cond_0

    if-eqz p5, :cond_0

    sub-int v0, p5, p9

    iget v1, p0, Lcom/muta/yanxi/view/c/a;->keyHeight:I

    if-le v0, v1, :cond_0

    .line 453
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->ast:Z

    .line 455
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ask:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 456
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->aaD:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setAlpha(F)V

    .line 458
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asj:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_0
.end method

.method protected rC()V
    .locals 8

    .prologue
    const/16 v7, 0x8

    const/4 v1, 0x0

    .line 369
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->sK()V

    move v0, v1

    .line 370
    :goto_0
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->arp:[I

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 371
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->Ys:Lcom/muta/yanxi/c/b/b;

    const-string v3, "sync_state"

    invoke-virtual {v2, v3, v1}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 372
    if-ne v2, v7, :cond_0

    .line 373
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    iget-object v3, p0, Lcom/muta/yanxi/view/c/a;->aso:[I

    aget v3, v3, v0

    iget-object v4, p0, Lcom/muta/yanxi/view/c/a;->asq:[I

    aget v4, v4, v0

    iget-object v5, p0, Lcom/muta/yanxi/view/c/a;->arr:[I

    aget v5, v5, v0

    iget-object v6, p0, Lcom/muta/yanxi/view/c/a;->ass:Lcom/muta/yanxi/view/c/a$b;

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->b(IIILcom/muta/yanxi/widget/ai_widget/input_menu/AIExtendMenu$a;)V

    .line 370
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 374
    :cond_0
    const/4 v3, 0x4

    if-le v2, v3, :cond_1

    if-ge v2, v7, :cond_1

    .line 375
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    iget-object v3, p0, Lcom/muta/yanxi/view/c/a;->arp:[I

    aget v3, v3, v0

    iget-object v4, p0, Lcom/muta/yanxi/view/c/a;->asp:[I

    aget v4, v4, v0

    iget-object v5, p0, Lcom/muta/yanxi/view/c/a;->arr:[I

    aget v5, v5, v0

    iget-object v6, p0, Lcom/muta/yanxi/view/c/a;->ass:Lcom/muta/yanxi/view/c/a$b;

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->b(IIILcom/muta/yanxi/widget/ai_widget/input_menu/AIExtendMenu$a;)V

    goto :goto_1

    .line 377
    :cond_1
    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    iget-object v3, p0, Lcom/muta/yanxi/view/c/a;->arp:[I

    aget v3, v3, v0

    iget-object v4, p0, Lcom/muta/yanxi/view/c/a;->asr:[I

    aget v4, v4, v0

    iget-object v5, p0, Lcom/muta/yanxi/view/c/a;->arr:[I

    aget v5, v5, v0

    iget-object v6, p0, Lcom/muta/yanxi/view/c/a;->ass:Lcom/muta/yanxi/view/c/a$b;

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->b(IIILcom/muta/yanxi/widget/ai_widget/input_menu/AIExtendMenu$a;)V

    goto :goto_1

    .line 381
    :cond_2
    return-void
.end method

.method public rU()V
    .locals 0

    .prologue
    .line 268
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->rJ()V

    .line 269
    invoke-direct {p0}, Lcom/muta/yanxi/view/c/a;->rK()V

    .line 270
    invoke-virtual {p0}, Lcom/muta/yanxi/view/c/a;->rC()V

    .line 271
    return-void
.end method

.method protected rW()V
    .locals 6

    .prologue
    .line 384
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->sK()V

    .line 385
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->arp:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 386
    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->ahb:Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a;->arp:[I

    aget v2, v2, v0

    iget-object v3, p0, Lcom/muta/yanxi/view/c/a;->asr:[I

    aget v3, v3, v0

    iget-object v4, p0, Lcom/muta/yanxi/view/c/a;->arr:[I

    aget v4, v4, v0

    iget-object v5, p0, Lcom/muta/yanxi/view/c/a;->ass:Lcom/muta/yanxi/view/c/a$b;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu;->b(IIILcom/muta/yanxi/widget/ai_widget/input_menu/AIExtendMenu$a;)V

    .line 385
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 388
    :cond_0
    return-void
.end method

.method public rY()V
    .locals 2

    .prologue
    .line 539
    new-instance v0, Lcom/muta/yanxi/entity/AiDebugMessage;

    invoke-direct {v0}, Lcom/muta/yanxi/entity/AiDebugMessage;-><init>()V

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    .line 540
    const-string v0, "\u8c03\u6559\u6a21\u5f0f\u5f00\u542f...,\u8bf7\u8f93\u5165\u95ee\u9898\uff0c\u7ed3\u675f\u8bf7\u518d\u6309\u4e00\u6b21\u8c03\u6559\u6309\u94ae\u3002"

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/c/a;->cp(Ljava/lang/String;)V

    .line 541
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 548
    :cond_0
    :goto_0
    return-void

    .line 544
    :cond_1
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asw:Lcom/muta/yanxi/entity/AiDebugMessage;

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/entity/AiDebugMessage;->setContent(Ljava/lang/String;)V

    .line 545
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u95ee\u9898 = \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asv:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\", \u8bf7\u8f93\u5165\u56de\u5e94"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/c/a;->cp(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public sb()V
    .locals 2

    .prologue
    return-void

    .line 771
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->arh:Lme/iwf/photopicker/d/c;

    if-nez v0, :cond_0

    .line 772
    new-instance v0, Lme/iwf/photopicker/d/c;

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-direct {v0, v1}, Lme/iwf/photopicker/d/c;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/c/a;->arh:Lme/iwf/photopicker/d/c;

    .line 774
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->arh:Lme/iwf/photopicker/d/c;

    invoke-virtual {v0}, Lme/iwf/photopicker/d/c;->wO()V

    .line 775
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->arh:Lme/iwf/photopicker/d/c;

    invoke-virtual {v0}, Lme/iwf/photopicker/d/c;->wP()Ljava/lang/String;

    move-result-object v0

    .line 776
    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/c/a;->ce(Ljava/lang/String;)V

    .line 778
    return-void
.end method

.method protected sendMessage(Lcom/hyphenate/chat/EMMessage;)V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->asf:Lcom/muta/yanxi/base/b;

    invoke-static {v0, p1}, Lcom/muta/yanxi/offline/OfflineChatBridge;->onMessage(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 642
    if-nez p1, :cond_1

    .line 652
    :cond_0
    :goto_0
    return-void

    .line 646
    :cond_1
    sget-object v0, Lcom/hyphenate/chat/EMMessage$Status;->SUCCESS:Lcom/hyphenate/chat/EMMessage$Status;

    invoke-virtual {p1, v0}, Lcom/hyphenate/chat/EMMessage;->setStatus(Lcom/hyphenate/chat/EMMessage$Status;)V

    .line 647
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/hyphenate/chat/EMChatManager;->saveMessage(Lcom/hyphenate/chat/EMMessage;)V

    .line 649
    iget-boolean v0, p0, Lcom/muta/yanxi/view/c/a;->ars:Z

    if-eqz v0, :cond_0

    .line 650
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a;->ahe:Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/ai_widget/messagelist/AIMessageList;->op()V

    goto :goto_0
.end method
