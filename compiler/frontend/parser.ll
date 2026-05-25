; ModuleID = 'nera_program'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i8* @malloc(i64)
declare void @free(i8*)
declare i8* @strncpy(i8*, i8*, i64)
declare i32 @strcmp(i8*, i8*)
declare i64 @strlen(i64)
declare i8* @int_to_string(i8*)
declare i8* @concat_strings(i64, i64)
declare void @print_int(i64**)
declare void @print_float(i64**)
declare i64 @puts(i64**)
declare i64** @alloc_array_Spanned_Expression(i64, i64**)
declare i64* @ptr_read_Spanned_Expression(i64, i64)
declare void @ptr_write_Spanned_Expression(i64, i64, i8*)
declare void @free_array_Spanned_Expression(i64)
declare i8** @alloc_array_String(i64, i64**)
declare i8* @ptr_read_String(i64, i64)
declare void @ptr_write_String(i64, i64, i8*)
declare void @free_array_String(i64)
declare i64** @alloc_array_Spanned_Type(i64, i64**)
declare i64** @alloc_array_Spanned_Statement(i64, i64**)
declare i64* @ptr_read_Spanned_Statement(i64, i64)
declare void @ptr_write_Spanned_Statement(i64, i64, i8*)
declare void @free_array_Spanned_Statement(i64)
declare i64** @alloc_array_Param(i64, i64**)
declare i64* @ptr_read_Param(i64, i64)
declare void @ptr_write_Param(i64, i64, i8*)
declare void @free_array_Param(i64)
declare i64** @alloc_array_FieldDecl(i64, i64**)
declare i64* @ptr_read_FieldDecl(i64, i64)
declare void @ptr_write_FieldDecl(i64, i64, i8*)
declare void @free_array_FieldDecl(i64)
declare i64** @alloc_array_VariantDecl(i64, i64**)
declare i64* @ptr_read_Spanned_Type(i64, i64)
declare void @ptr_write_Spanned_Type(i64, i64, i8*)
declare void @free_array_Spanned_Type(i64)
declare i64* @ptr_read_VariantDecl(i64, i64)
declare void @ptr_write_VariantDecl(i64, i64, i8*)
declare void @free_array_VariantDecl(i64)
declare i64** @alloc_array_Spanned_ImportDirective(i64, i64**)
declare i64** @alloc_array_Spanned_Declaration(i64, i64**)
declare i64* @ptr_read_Spanned_ImportDirective(i64, i64)
declare void @ptr_write_Spanned_ImportDirective(i64, i64, i8*)
declare void @free_array_Spanned_ImportDirective(i64)
declare i64* @ptr_read_Spanned_Declaration(i64, i64)
declare void @ptr_write_Spanned_Declaration(i64, i64, i8*)
declare void @free_array_Spanned_Declaration(i64)
declare i64** @alloc_array_WhenCase(i64, i64**)
declare i64* @ptr_read_WhenCase(i64, i64)
declare void @ptr_write_WhenCase(i64, i64, i8*)
declare void @free_array_WhenCase(i64)

@.str.0 = private unnamed_addr constant [23 x i8] c"Unexpected character !\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Unterminated string literal\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Unterminated character literal\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Unterminated escape sequence\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Invalid escape sequence\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"Expected closing quote for character literal\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"data\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"fn\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"let\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"mut\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"when\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@.str.17 = private unnamed_addr constant [4 x i8] c"use\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"choice\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"alloc\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"free\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.25 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@.str.27 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@.str.28 = private unnamed_addr constant [7 x i8] c"bitand\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"bitor\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"bitxor\00", align 1
@.str.31 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"shr\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"as\00", align 1
@.str.34 = private unnamed_addr constant [21 x i8] c"Unexpected character\00", align 1
@.str.35 = private unnamed_addr constant [5 x i8] c"Data\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"Fn\00", align 1
@.str.37 = private unnamed_addr constant [4 x i8] c"Let\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"Mut\00", align 1
@.str.39 = private unnamed_addr constant [3 x i8] c"If\00", align 1
@.str.40 = private unnamed_addr constant [5 x i8] c"Else\00", align 1
@.str.41 = private unnamed_addr constant [6 x i8] c"While\00", align 1
@.str.42 = private unnamed_addr constant [7 x i8] c"Return\00", align 1
@.str.43 = private unnamed_addr constant [5 x i8] c"When\00", align 1
@.str.44 = private unnamed_addr constant [6 x i8] c"Break\00", align 1
@.str.45 = private unnamed_addr constant [9 x i8] c"Continue\00", align 1
@.str.46 = private unnamed_addr constant [4 x i8] c"Use\00", align 1
@.str.47 = private unnamed_addr constant [7 x i8] c"Extern\00", align 1
@.str.48 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@.str.49 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@.str.50 = private unnamed_addr constant [7 x i8] c"Choice\00", align 1
@.str.51 = private unnamed_addr constant [4 x i8] c"And\00", align 1
@.str.52 = private unnamed_addr constant [3 x i8] c"Or\00", align 1
@.str.53 = private unnamed_addr constant [4 x i8] c"Not\00", align 1
@.str.54 = private unnamed_addr constant [7 x i8] c"BitAnd\00", align 1
@.str.55 = private unnamed_addr constant [6 x i8] c"BitOr\00", align 1
@.str.56 = private unnamed_addr constant [7 x i8] c"BitXor\00", align 1
@.str.57 = private unnamed_addr constant [4 x i8] c"Shl\00", align 1
@.str.58 = private unnamed_addr constant [4 x i8] c"Shr\00", align 1
@.str.59 = private unnamed_addr constant [3 x i8] c"As\00", align 1
@.str.60 = private unnamed_addr constant [11 x i8] c"Identifier\00", align 1
@.str.61 = private unnamed_addr constant [8 x i8] c"Integer\00", align 1
@.str.62 = private unnamed_addr constant [6 x i8] c"Float\00", align 1
@.str.63 = private unnamed_addr constant [14 x i8] c"StringLiteral\00", align 1
@.str.64 = private unnamed_addr constant [12 x i8] c"CharLiteral\00", align 1
@.str.65 = private unnamed_addr constant [7 x i8] c"Assign\00", align 1
@.str.66 = private unnamed_addr constant [10 x i8] c"AddAssign\00", align 1
@.str.67 = private unnamed_addr constant [10 x i8] c"SubAssign\00", align 1
@.str.68 = private unnamed_addr constant [10 x i8] c"MulAssign\00", align 1
@.str.69 = private unnamed_addr constant [10 x i8] c"DivAssign\00", align 1
@.str.70 = private unnamed_addr constant [3 x i8] c"Eq\00", align 1
@.str.71 = private unnamed_addr constant [6 x i8] c"NotEq\00", align 1
@.str.72 = private unnamed_addr constant [3 x i8] c"Lt\00", align 1
@.str.73 = private unnamed_addr constant [5 x i8] c"LtEq\00", align 1
@.str.74 = private unnamed_addr constant [3 x i8] c"Gt\00", align 1
@.str.75 = private unnamed_addr constant [5 x i8] c"GtEq\00", align 1
@.str.76 = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@.str.77 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@.str.78 = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@.str.79 = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@.str.80 = private unnamed_addr constant [4 x i8] c"Mod\00", align 1
@.str.81 = private unnamed_addr constant [5 x i8] c"Pipe\00", align 1
@.str.82 = private unnamed_addr constant [6 x i8] c"Arrow\00", align 1
@.str.83 = private unnamed_addr constant [6 x i8] c"Caret\00", align 1
@.str.84 = private unnamed_addr constant [6 x i8] c"Alloc\00", align 1
@.str.85 = private unnamed_addr constant [5 x i8] c"Free\00", align 1
@.str.86 = private unnamed_addr constant [9 x i8] c"Question\00", align 1
@.str.87 = private unnamed_addr constant [12 x i8] c"NoneLiteral\00", align 1
@.str.88 = private unnamed_addr constant [7 x i8] c"LBrace\00", align 1
@.str.89 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.90 = private unnamed_addr constant [9 x i8] c"LBracket\00", align 1
@.str.91 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.92 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.93 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.94 = private unnamed_addr constant [6 x i8] c"Colon\00", align 1
@.str.95 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.96 = private unnamed_addr constant [4 x i8] c"Dot\00", align 1
@.str.97 = private unnamed_addr constant [7 x i8] c"DotDot\00", align 1
@.str.98 = private unnamed_addr constant [6 x i8] c"Error\00", align 1
@.str.99 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.100 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.101 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.102 = private unnamed_addr constant [5 x i8] c"Pipe\00", align 1
@.str.103 = private unnamed_addr constant [4 x i8] c"And\00", align 1
@.str.104 = private unnamed_addr constant [3 x i8] c"Or\00", align 1
@.str.105 = private unnamed_addr constant [3 x i8] c"Or\00", align 1
@.str.106 = private unnamed_addr constant [6 x i8] c"BitOr\00", align 1
@.str.107 = private unnamed_addr constant [7 x i8] c"BitXor\00", align 1
@.str.108 = private unnamed_addr constant [7 x i8] c"BitAnd\00", align 1
@.str.109 = private unnamed_addr constant [3 x i8] c"Eq\00", align 1
@.str.110 = private unnamed_addr constant [6 x i8] c"NotEq\00", align 1
@.str.111 = private unnamed_addr constant [6 x i8] c"NotEq\00", align 1
@.str.112 = private unnamed_addr constant [3 x i8] c"Lt\00", align 1
@.str.113 = private unnamed_addr constant [5 x i8] c"LtEq\00", align 1
@.str.114 = private unnamed_addr constant [3 x i8] c"Gt\00", align 1
@.str.115 = private unnamed_addr constant [5 x i8] c"GtEq\00", align 1
@.str.116 = private unnamed_addr constant [5 x i8] c"LtEq\00", align 1
@.str.117 = private unnamed_addr constant [3 x i8] c"Gt\00", align 1
@.str.118 = private unnamed_addr constant [5 x i8] c"GtEq\00", align 1
@.str.119 = private unnamed_addr constant [4 x i8] c"Shl\00", align 1
@.str.120 = private unnamed_addr constant [4 x i8] c"Shr\00", align 1
@.str.121 = private unnamed_addr constant [4 x i8] c"Shr\00", align 1
@.str.122 = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@.str.123 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@.str.124 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@.str.125 = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@.str.126 = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@.str.127 = private unnamed_addr constant [4 x i8] c"Mod\00", align 1
@.str.128 = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@.str.129 = private unnamed_addr constant [4 x i8] c"Mod\00", align 1
@.str.130 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.131 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.132 = private unnamed_addr constant [42 x i8] c"Expected identifier for generic parameter\00", align 1
@.str.133 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.134 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.135 = private unnamed_addr constant [42 x i8] c"Expected identifier for generic parameter\00", align 1
@.str.136 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.137 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.138 = private unnamed_addr constant [38 x i8] c"Expected ')' after generic parameters\00", align 1
@.str.139 = private unnamed_addr constant [9 x i8] c"Question\00", align 1
@.str.140 = private unnamed_addr constant [6 x i8] c"Caret\00", align 1
@.str.141 = private unnamed_addr constant [19 x i8] c"Expected type name\00", align 1
@.str.142 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.143 = private unnamed_addr constant [4 x i8] c"Mut\00", align 1
@.str.144 = private unnamed_addr constant [24 x i8] c"Expected parameter name\00", align 1
@.str.145 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.146 = private unnamed_addr constant [6 x i8] c"Colon\00", align 1
@.str.147 = private unnamed_addr constant [34 x i8] c"Expected ':' after parameter name\00", align 1
@.str.148 = private unnamed_addr constant [3 x i8] c"If\00", align 1
@.str.149 = private unnamed_addr constant [14 x i8] c"Expected 'if'\00", align 1
@.str.150 = private unnamed_addr constant [5 x i8] c"Else\00", align 1
@.str.151 = private unnamed_addr constant [3 x i8] c"If\00", align 1
@.str.152 = private unnamed_addr constant [6 x i8] c"While\00", align 1
@.str.153 = private unnamed_addr constant [17 x i8] c"Expected 'while'\00", align 1
@.str.154 = private unnamed_addr constant [7 x i8] c"Return\00", align 1
@.str.155 = private unnamed_addr constant [18 x i8] c"Expected 'return'\00", align 1
@.str.156 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.157 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.158 = private unnamed_addr constant [5 x i8] c"Free\00", align 1
@.str.159 = private unnamed_addr constant [16 x i8] c"Expected 'free'\00", align 1
@.str.160 = private unnamed_addr constant [4 x i8] c"Let\00", align 1
@.str.161 = private unnamed_addr constant [4 x i8] c"Mut\00", align 1
@.str.162 = private unnamed_addr constant [3 x i8] c"If\00", align 1
@.str.163 = private unnamed_addr constant [6 x i8] c"While\00", align 1
@.str.164 = private unnamed_addr constant [7 x i8] c"Return\00", align 1
@.str.165 = private unnamed_addr constant [6 x i8] c"Break\00", align 1
@.str.166 = private unnamed_addr constant [9 x i8] c"Continue\00", align 1
@.str.167 = private unnamed_addr constant [5 x i8] c"Free\00", align 1
@.str.168 = private unnamed_addr constant [7 x i8] c"Assign\00", align 1
@.str.169 = private unnamed_addr constant [10 x i8] c"AddAssign\00", align 1
@.str.170 = private unnamed_addr constant [10 x i8] c"SubAssign\00", align 1
@.str.171 = private unnamed_addr constant [10 x i8] c"MulAssign\00", align 1
@.str.172 = private unnamed_addr constant [10 x i8] c"DivAssign\00", align 1
@.str.173 = private unnamed_addr constant [7 x i8] c"LBrace\00", align 1
@.str.174 = private unnamed_addr constant [26 x i8] c"Expected '{' before block\00", align 1
@.str.175 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.176 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.177 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.178 = private unnamed_addr constant [25 x i8] c"Expected '}' after block\00", align 1
@.str.179 = private unnamed_addr constant [3 x i8] c"Fn\00", align 1
@.str.180 = private unnamed_addr constant [14 x i8] c"Expected 'fn'\00", align 1
@.str.181 = private unnamed_addr constant [38 x i8] c"Expected identifier for function name\00", align 1
@.str.182 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.183 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.184 = private unnamed_addr constant [33 x i8] c"Expected '(' after function name\00", align 1
@.str.185 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.186 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.187 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.188 = private unnamed_addr constant [30 x i8] c"Expected ')' after parameters\00", align 1
@.str.189 = private unnamed_addr constant [6 x i8] c"Arrow\00", align 1
@.str.190 = private unnamed_addr constant [20 x i8] c"Expected field name\00", align 1
@.str.191 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.192 = private unnamed_addr constant [6 x i8] c"Colon\00", align 1
@.str.193 = private unnamed_addr constant [30 x i8] c"Expected ':' after field name\00", align 1
@.str.194 = private unnamed_addr constant [5 x i8] c"Data\00", align 1
@.str.195 = private unnamed_addr constant [16 x i8] c"Expected 'data'\00", align 1
@.str.196 = private unnamed_addr constant [34 x i8] c"Expected identifier for data name\00", align 1
@.str.197 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.198 = private unnamed_addr constant [7 x i8] c"LBrace\00", align 1
@.str.199 = private unnamed_addr constant [30 x i8] c"Expected '{' before data body\00", align 1
@.str.200 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.201 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.202 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.203 = private unnamed_addr constant [29 x i8] c"Expected '}' after data body\00", align 1
@.str.204 = private unnamed_addr constant [4 x i8] c"Mut\00", align 1
@.str.205 = private unnamed_addr constant [4 x i8] c"Let\00", align 1
@.str.206 = private unnamed_addr constant [24 x i8] c"Expected 'let' or 'mut'\00", align 1
@.str.207 = private unnamed_addr constant [38 x i8] c"Expected identifier for variable name\00", align 1
@.str.208 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.209 = private unnamed_addr constant [6 x i8] c"Colon\00", align 1
@.str.210 = private unnamed_addr constant [7 x i8] c"Assign\00", align 1
@.str.211 = private unnamed_addr constant [37 x i8] c"Expected '=' in variable declaration\00", align 1
@.str.212 = private unnamed_addr constant [7 x i8] c"Choice\00", align 1
@.str.213 = private unnamed_addr constant [18 x i8] c"Expected 'choice'\00", align 1
@.str.214 = private unnamed_addr constant [36 x i8] c"Expected identifier for choice name\00", align 1
@.str.215 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.216 = private unnamed_addr constant [7 x i8] c"LBrace\00", align 1
@.str.217 = private unnamed_addr constant [32 x i8] c"Expected '{' before choice body\00", align 1
@.str.218 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.219 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.220 = private unnamed_addr constant [12 x i8] c"NoneLiteral\00", align 1
@.str.221 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.222 = private unnamed_addr constant [37 x i8] c"Expected identifier for variant name\00", align 1
@.str.223 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.224 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.225 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.226 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.227 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.228 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.229 = private unnamed_addr constant [36 x i8] c"Expected ')' after associated types\00", align 1
@.str.230 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.231 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.232 = private unnamed_addr constant [31 x i8] c"Expected '}' after choice body\00", align 1
@.str.233 = private unnamed_addr constant [7 x i8] c"Extern\00", align 1
@.str.234 = private unnamed_addr constant [18 x i8] c"Expected 'extern'\00", align 1
@.str.235 = private unnamed_addr constant [3 x i8] c"Fn\00", align 1
@.str.236 = private unnamed_addr constant [29 x i8] c"Expected 'fn' after 'extern'\00", align 1
@.str.237 = private unnamed_addr constant [47 x i8] c"Expected identifier for external function name\00", align 1
@.str.238 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.239 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.240 = private unnamed_addr constant [33 x i8] c"Expected '(' after function name\00", align 1
@.str.241 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.242 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.243 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.244 = private unnamed_addr constant [30 x i8] c"Expected ')' after parameters\00", align 1
@.str.245 = private unnamed_addr constant [6 x i8] c"Arrow\00", align 1
@.str.246 = private unnamed_addr constant [5 x i8] c"Data\00", align 1
@.str.247 = private unnamed_addr constant [7 x i8] c"Choice\00", align 1
@.str.248 = private unnamed_addr constant [3 x i8] c"Fn\00", align 1
@.str.249 = private unnamed_addr constant [7 x i8] c"Extern\00", align 1
@.str.250 = private unnamed_addr constant [4 x i8] c"Let\00", align 1
@.str.251 = private unnamed_addr constant [4 x i8] c"Mut\00", align 1
@.str.252 = private unnamed_addr constant [4 x i8] c"Use\00", align 1
@.str.253 = private unnamed_addr constant [15 x i8] c"Expected 'use'\00", align 1
@.str.254 = private unnamed_addr constant [35 x i8] c"Expected identifier in import path\00", align 1
@.str.255 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.256 = private unnamed_addr constant [4 x i8] c"Dot\00", align 1
@.str.257 = private unnamed_addr constant [45 x i8] c"Expected identifier after '.' in import path\00", align 1
@.str.258 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.259 = private unnamed_addr constant [4 x i8] c"Use\00", align 1
@.str.260 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.261 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.262 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@.str.263 = private unnamed_addr constant [4 x i8] c"Not\00", align 1
@.str.264 = private unnamed_addr constant [4 x i8] c"Not\00", align 1
@.str.265 = private unnamed_addr constant [3 x i8] c"As\00", align 1
@.str.266 = private unnamed_addr constant [33 x i8] c"Expected a valid type after 'as'\00", align 1
@.str.267 = private unnamed_addr constant [4 x i8] c"Dot\00", align 1
@.str.268 = private unnamed_addr constant [12 x i8] c"NoneLiteral\00", align 1
@.str.269 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.270 = private unnamed_addr constant [30 x i8] c"Expected identifier after '.'\00", align 1
@.str.271 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.272 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.273 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.274 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.275 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.276 = private unnamed_addr constant [36 x i8] c"Expected ')' after method arguments\00", align 1
@.str.277 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.278 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.279 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.280 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.281 = private unnamed_addr constant [38 x i8] c"Expected ')' after function arguments\00", align 1
@.str.282 = private unnamed_addr constant [6 x i8] c"Caret\00", align 1
@.str.283 = private unnamed_addr constant [9 x i8] c"LBracket\00", align 1
@.str.284 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.285 = private unnamed_addr constant [7 x i8] c"DotDot\00", align 1
@.str.286 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.287 = private unnamed_addr constant [7 x i8] c"DotDot\00", align 1
@.str.288 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.289 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.290 = private unnamed_addr constant [41 x i8] c"Expected '..' for slice or ']' for index\00", align 1
@.str.291 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.292 = private unnamed_addr constant [31 x i8] c"Expected ']' after slice/index\00", align 1
@.str.293 = private unnamed_addr constant [5 x i8] c"When\00", align 1
@.str.294 = private unnamed_addr constant [16 x i8] c"Expected 'when'\00", align 1
@.str.295 = private unnamed_addr constant [7 x i8] c"LBrace\00", align 1
@.str.296 = private unnamed_addr constant [31 x i8] c"Expected '{' before when cases\00", align 1
@.str.297 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.298 = private unnamed_addr constant [4 x i8] c"Eof\00", align 1
@.str.299 = private unnamed_addr constant [12 x i8] c"NoneLiteral\00", align 1
@.str.300 = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.301 = private unnamed_addr constant [35 x i8] c"Expected variant name in when case\00", align 1
@.str.302 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.303 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.304 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.305 = private unnamed_addr constant [32 x i8] c"Expected identifier for binding\00", align 1
@.str.306 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.307 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.308 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.309 = private unnamed_addr constant [32 x i8] c"Expected identifier for binding\00", align 1
@.str.310 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.311 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.312 = private unnamed_addr constant [28 x i8] c"Expected ')' after bindings\00", align 1
@.str.313 = private unnamed_addr constant [6 x i8] c"Arrow\00", align 1
@.str.314 = private unnamed_addr constant [38 x i8] c"Expected '->' after when case pattern\00", align 1
@.str.315 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.316 = private unnamed_addr constant [7 x i8] c"RBrace\00", align 1
@.str.317 = private unnamed_addr constant [30 x i8] c"Expected '}' after when cases\00", align 1
@.str.318 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.319 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.320 = private unnamed_addr constant [9 x i8] c"RBracket\00", align 1
@.str.321 = private unnamed_addr constant [32 x i8] c"Expected ']' after list literal\00", align 1
@.str.322 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.323 = private unnamed_addr constant [38 x i8] c"Expected ')' after grouped expression\00", align 1
@.str.324 = private unnamed_addr constant [28 x i8] c"Expected type after 'alloc'\00", align 1
@.str.325 = private unnamed_addr constant [7 x i8] c"LParen\00", align 1
@.str.326 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.327 = private unnamed_addr constant [6 x i8] c"Comma\00", align 1
@.str.328 = private unnamed_addr constant [7 x i8] c"RParen\00", align 1
@.str.329 = private unnamed_addr constant [35 x i8] c"Expected ')' after alloc arguments\00", align 1
@.str.330 = private unnamed_addr constant [39 x i8] c"Unexpected token in primary expression\00", align 1

define i64** @alloc_lexer(i8* noalias %param_src) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i8* %param_src, i8** %ptr_src
  %1 = call i8* @malloc(i64 40)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_lex
  %3 = load i64**, i64*** %ptr_lex
  %4 = load i8*, i8** %ptr_src
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i8**
  store i8* %4, i8** %7, align 8
  %8 = load i64**, i64*** %ptr_lex
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i8*, i8** %ptr_src
  %13 = call i64 @strlen(i8* %12)
  %14 = load i8*, i8** %ptr_src
  %15 = call i64 @strlen(i8* %14)
  %16 = load i64**, i64*** %ptr_lex
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 2
  %19 = bitcast i64* %18 to i64*
  store i64 %15, i64* %19, align 8
  %20 = load i64**, i64*** %ptr_lex
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 3
  %23 = bitcast i64* %22 to i64*
  store i64 1, i64* %23, align 8
  %24 = load i64**, i64*** %ptr_lex
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 4
  %27 = bitcast i64* %26 to i64*
  store i64 1, i64* %27, align 8
  %28 = load i64**, i64*** %ptr_lex
  ret i64** %28
unreachable_0:
  ret i64** null
}

define void @free_lexer(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = bitcast i64** %1 to i8*
  call void @free(i8* %2)
  ret void
}

define i1 @is_at_end(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_lex
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 2
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp sge i64 %5, %10
  ret i1 %11
unreachable_0:
  ret i1 0
}

define i64 @peek(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = call i1 @is_at_end(i64** %1)
  br i1 %2, label %then_0, label %end_if_1
then_0:
  ret i64 0
unreachable_2:
  br label %end_if_1
end_if_1:
  %3 = load i64**, i64*** %ptr_lex
  %4 = bitcast i64** %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 0
  %6 = bitcast i64* %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %8 = load i64**, i64*** %ptr_lex
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i64
  ret i64 %15
unreachable_3:
  ret i64 0
}

define i64 @peek_next(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = add nsw i64 %5, 1
  %7 = load i64**, i64*** %ptr_lex
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 2
  %10 = bitcast i64* %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = icmp sge i64 %6, %11
  br i1 %12, label %then_0, label %end_if_1
then_0:
  ret i64 0
unreachable_2:
  br label %end_if_1
end_if_1:
  %13 = load i64**, i64*** %ptr_lex
  %14 = bitcast i64** %13 to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 0
  %16 = bitcast i64* %15 to i8**
  %17 = load i8*, i8** %16, align 8
  %18 = load i64**, i64*** %ptr_lex
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 1
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = add nsw i64 %22, 1
  %24 = getelementptr inbounds i8, i8* %17, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i64
  ret i64 %26
unreachable_3:
  ret i64 0
}

define i64 @advance(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  %2 = call i64 @peek(i64** %1)
  %3 = load i64**, i64*** %ptr_lex
  %4 = bitcast i64** %3 to i64*
  %5 = getelementptr inbounds i64, i64* %4, i64 1
  %6 = bitcast i64* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = add nsw i64 %7, 1
  %9 = load i64**, i64*** %ptr_lex
  %10 = bitcast i64** %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i64*
  store i64 %8, i64* %12, align 8
  %13 = icmp eq i64 %2, 10
  br i1 %13, label %then_0, label %else_2
then_0:
  %14 = load i64**, i64*** %ptr_lex
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 3
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = add nsw i64 %18, 1
  %20 = load i64**, i64*** %ptr_lex
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 3
  %23 = bitcast i64* %22 to i64*
  store i64 %19, i64* %23, align 8
  %24 = load i64**, i64*** %ptr_lex
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 4
  %27 = bitcast i64* %26 to i64*
  store i64 1, i64* %27, align 8
  br label %end_if_1
else_2:
  %28 = load i64**, i64*** %ptr_lex
  %29 = bitcast i64** %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 4
  %31 = bitcast i64* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, 1
  %34 = load i64**, i64*** %ptr_lex
  %35 = bitcast i64** %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 4
  %37 = bitcast i64* %36 to i64*
  store i64 %33, i64* %37, align 8
  br label %end_if_1
end_if_1:
  ret i64 %2
unreachable_3:
  ret i64 0
}

define i1 @is_whitespace(i64** noalias %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_c, i64*** %ptr_c
  %1 = load i64**, i64*** %ptr_c
  %2 = icmp eq i64** %1, 32
  %3 = load i64**, i64*** %ptr_c
  %4 = icmp eq i64** %3, 13
  %5 = or i1 %2, %4
  %6 = load i64**, i64*** %ptr_c
  %7 = icmp eq i64** %6, 9
  %8 = or i1 %5, %7
  %9 = load i64**, i64*** %ptr_c
  %10 = icmp eq i64** %9, 10
  %11 = or i1 %8, %10
  ret i1 %11
unreachable_0:
  ret i1 0
}

define i1 @is_alpha(i64** noalias %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_c, i64*** %ptr_c
  %1 = load i64**, i64*** %ptr_c
  %2 = icmp sge i64** %1, 97
  %3 = load i64**, i64*** %ptr_c
  %4 = icmp sle i64** %3, 122
  %5 = and i1 %2, %4
  %6 = load i64**, i64*** %ptr_c
  %7 = icmp sge i64** %6, 65
  %8 = load i64**, i64*** %ptr_c
  %9 = icmp sle i64** %8, 90
  %10 = and i1 %7, %9
  %11 = or i1 %5, %10
  %12 = load i64**, i64*** %ptr_c
  %13 = icmp eq i64** %12, 95
  %14 = or i1 %11, %13
  ret i1 %14
unreachable_0:
  ret i1 0
}

define i1 @is_digit(i64** noalias %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_c, i64*** %ptr_c
  %1 = load i64**, i64*** %ptr_c
  %2 = icmp sge i64** %1, 48
  %3 = load i64**, i64*** %ptr_c
  %4 = icmp sle i64** %3, 57
  %5 = and i1 %2, %4
  ret i1 %5
unreachable_0:
  ret i1 0
}

define i1 @is_alphanumeric(i64** noalias %param_c) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_c, i64*** %ptr_c
  %1 = load i64**, i64*** %ptr_c
  %2 = call i1 @is_alpha(i64** %1)
  %3 = load i64**, i64*** %ptr_c
  %4 = call i1 @is_digit(i64** %3)
  %5 = or i1 %2, %4
  ret i1 %5
unreachable_0:
  ret i1 0
}

define void @skip_whitespace(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  br label %while_cond_0
while_cond_0:
  %1 = load i64**, i64*** %ptr_lex
  %2 = call i1 @is_at_end(i64** %1)
  %3 = xor i1 %2, 1
  br i1 %3, label %while_body_1, label %while_end_2
while_body_1:
  %4 = load i64**, i64*** %ptr_lex
  %5 = call i64 @peek(i64** %4)
  store i64 %5, i64*** %ptr_c
  %6 = load i64**, i64*** %ptr_c
  %7 = call i1 @is_whitespace(i64** %6)
  br i1 %7, label %then_3, label %else_5
then_3:
  %8 = load i64**, i64*** %ptr_lex
  %9 = call i64 @advance(i64** %8)
  br label %end_if_4
else_5:
  %10 = load i64**, i64*** %ptr_c
  %11 = icmp eq i64** %10, 47
  %12 = load i64**, i64*** %ptr_lex
  %13 = call i64 @peek_next(i64** %12)
  %14 = icmp eq i64 %13, 47
  %15 = and i1 %11, %14
  br i1 %15, label %then_6, label %else_8
then_6:
  br label %while_cond_9
while_cond_9:
  %16 = load i64**, i64*** %ptr_lex
  %17 = call i1 @is_at_end(i64** %16)
  %18 = xor i1 %17, 1
  %19 = load i64**, i64*** %ptr_lex
  %20 = call i64 @peek(i64** %19)
  %21 = icmp ne i64 %20, 10
  %22 = and i1 %18, %21
  br i1 %22, label %while_body_10, label %while_end_11
while_body_10:
  %23 = load i64**, i64*** %ptr_lex
  %24 = call i64 @advance(i64** %23)
  br label %while_cond_9
while_end_11:
  br label %end_if_7
else_8:
  %25 = load i64**, i64*** %ptr_c
  %26 = icmp eq i64** %25, 47
  %27 = load i64**, i64*** %ptr_lex
  %28 = call i64 @peek_next(i64** %27)
  %29 = icmp eq i64 %28, 42
  %30 = and i1 %26, %29
  br i1 %30, label %then_12, label %else_14
then_12:
  %31 = load i64**, i64*** %ptr_lex
  %32 = call i64 @advance(i64** %31)
  %33 = load i64**, i64*** %ptr_lex
  %34 = call i64 @advance(i64** %33)
  br label %while_cond_15
while_cond_15:
  %35 = load i64**, i64*** %ptr_lex
  %36 = call i1 @is_at_end(i64** %35)
  %37 = xor i1 %36, 1
  br i1 %37, label %while_body_16, label %while_end_17
while_body_16:
  %38 = load i64**, i64*** %ptr_lex
  %39 = call i64 @peek(i64** %38)
  %40 = icmp eq i64 %39, 42
  %41 = load i64**, i64*** %ptr_lex
  %42 = call i64 @peek_next(i64** %41)
  %43 = icmp eq i64 %42, 47
  %44 = and i1 %40, %43
  br i1 %44, label %then_18, label %end_if_19
then_18:
  %45 = load i64**, i64*** %ptr_lex
  %46 = call i64 @advance(i64** %45)
  %47 = load i64**, i64*** %ptr_lex
  %48 = call i64 @advance(i64** %47)
  br label %while_end_17
unreachable_20:
  br label %end_if_19
end_if_19:
  %49 = load i64**, i64*** %ptr_lex
  %50 = call i64 @advance(i64** %49)
  br label %while_cond_15
while_end_17:
  br label %end_if_13
else_14:
  br label %while_end_2
unreachable_21:
  br label %end_if_13
end_if_13:
  br label %end_if_7
end_if_7:
  br label %end_if_4
end_if_4:
  br label %while_cond_0
while_end_2:
  ret void
}

define i64** @make_token(i64* noalias %param_kind, i64 %param_line, i64 %param_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64* %param_kind, i64** %ptr_kind
  store i64 %param_line, i64* %ptr_line
  store i64 %param_col, i64* %ptr_col
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_tok
  %3 = load i64**, i64*** %ptr_tok
  %4 = load i64*, i64** %ptr_kind
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64**
  store i64* %4, i64** %7, align 8
  %8 = load i64**, i64*** %ptr_tok
  %9 = load i64, i64* %ptr_line
  %10 = bitcast i64** %8 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i64*
  store i64 %9, i64* %12, align 8
  %13 = load i64**, i64*** %ptr_tok
  %14 = load i64, i64* %ptr_col
  %15 = bitcast i64** %13 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  store i64 %14, i64* %17, align 8
  %18 = load i64**, i64*** %ptr_tok
  ret i64** %18
unreachable_0:
  ret i64** null
}

define i64** @next_token(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  %1 = load i64**, i64*** %ptr_lex
  call void @skip_whitespace(i64** %1)
  %2 = load i64**, i64*** %ptr_lex
  %3 = bitcast i64** %2 to i64*
  %4 = getelementptr inbounds i64, i64* %3, i64 3
  %5 = bitcast i64* %4 to i64*
  %6 = load i64, i64* %5, align 8
  %7 = load i64**, i64*** %ptr_lex
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 4
  %10 = bitcast i64* %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = load i64**, i64*** %ptr_lex
  %13 = call i1 @is_at_end(i64** %12)
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = call i8* @malloc(i64 8)
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 0
  store i64 64, i64* %16
  %17 = call i64** @make_token(i64* %15, i64 %6, i64 %11)
  ret i64** %17
unreachable_2:
  br label %end_if_1
end_if_1:
  %18 = load i64**, i64*** %ptr_lex
  %19 = call i64 @advance(i64** %18)
  store i64 %19, i64*** %ptr_c
  %20 = load i64**, i64*** %ptr_c
  %21 = icmp eq i64** %20, 43
  br i1 %21, label %then_3, label %end_if_4
then_3:
  %22 = load i64**, i64*** %ptr_lex
  %23 = call i64 @peek(i64** %22)
  %24 = icmp eq i64 %23, 61
  br i1 %24, label %then_5, label %end_if_6
then_5:
  %25 = load i64**, i64*** %ptr_lex
  %26 = call i64 @advance(i64** %25)
  %27 = call i8* @malloc(i64 8)
  %28 = bitcast i8* %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  store i64 31, i64* %29
  %30 = call i64** @make_token(i64* %28, i64 %6, i64 %11)
  ret i64** %30
unreachable_7:
  br label %end_if_6
end_if_6:
  %31 = call i8* @malloc(i64 8)
  %32 = bitcast i8* %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 0
  store i64 41, i64* %33
  %34 = call i64** @make_token(i64* %32, i64 %6, i64 %11)
  ret i64** %34
unreachable_8:
  br label %end_if_4
end_if_4:
  %35 = load i64**, i64*** %ptr_c
  %36 = icmp eq i64** %35, 45
  br i1 %36, label %then_9, label %end_if_10
then_9:
  %37 = load i64**, i64*** %ptr_lex
  %38 = call i64 @peek(i64** %37)
  %39 = icmp eq i64 %38, 62
  br i1 %39, label %then_11, label %end_if_12
then_11:
  %40 = load i64**, i64*** %ptr_lex
  %41 = call i64 @advance(i64** %40)
  %42 = call i8* @malloc(i64 8)
  %43 = bitcast i8* %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 0
  store i64 47, i64* %44
  %45 = call i64** @make_token(i64* %43, i64 %6, i64 %11)
  ret i64** %45
unreachable_13:
  br label %end_if_12
end_if_12:
  %46 = load i64**, i64*** %ptr_lex
  %47 = call i64 @peek(i64** %46)
  %48 = icmp eq i64 %47, 61
  br i1 %48, label %then_14, label %end_if_15
then_14:
  %49 = load i64**, i64*** %ptr_lex
  %50 = call i64 @advance(i64** %49)
  %51 = call i8* @malloc(i64 8)
  %52 = bitcast i8* %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 0
  store i64 32, i64* %53
  %54 = call i64** @make_token(i64* %52, i64 %6, i64 %11)
  ret i64** %54
unreachable_16:
  br label %end_if_15
end_if_15:
  %55 = call i8* @malloc(i64 8)
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 0
  store i64 42, i64* %57
  %58 = call i64** @make_token(i64* %56, i64 %6, i64 %11)
  ret i64** %58
unreachable_17:
  br label %end_if_10
end_if_10:
  %59 = load i64**, i64*** %ptr_c
  %60 = icmp eq i64** %59, 42
  br i1 %60, label %then_18, label %end_if_19
then_18:
  %61 = load i64**, i64*** %ptr_lex
  %62 = call i64 @peek(i64** %61)
  %63 = icmp eq i64 %62, 61
  br i1 %63, label %then_20, label %end_if_21
then_20:
  %64 = load i64**, i64*** %ptr_lex
  %65 = call i64 @advance(i64** %64)
  %66 = call i8* @malloc(i64 8)
  %67 = bitcast i8* %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  store i64 33, i64* %68
  %69 = call i64** @make_token(i64* %67, i64 %6, i64 %11)
  ret i64** %69
unreachable_22:
  br label %end_if_21
end_if_21:
  %70 = call i8* @malloc(i64 8)
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 0
  store i64 43, i64* %72
  %73 = call i64** @make_token(i64* %71, i64 %6, i64 %11)
  ret i64** %73
unreachable_23:
  br label %end_if_19
end_if_19:
  %74 = load i64**, i64*** %ptr_c
  %75 = icmp eq i64** %74, 47
  br i1 %75, label %then_24, label %end_if_25
then_24:
  %76 = load i64**, i64*** %ptr_lex
  %77 = call i64 @peek(i64** %76)
  %78 = icmp eq i64 %77, 61
  br i1 %78, label %then_26, label %end_if_27
then_26:
  %79 = load i64**, i64*** %ptr_lex
  %80 = call i64 @advance(i64** %79)
  %81 = call i8* @malloc(i64 8)
  %82 = bitcast i8* %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 0
  store i64 34, i64* %83
  %84 = call i64** @make_token(i64* %82, i64 %6, i64 %11)
  ret i64** %84
unreachable_28:
  br label %end_if_27
end_if_27:
  %85 = call i8* @malloc(i64 8)
  %86 = bitcast i8* %85 to i64*
  %87 = getelementptr inbounds i64, i64* %86, i64 0
  store i64 44, i64* %87
  %88 = call i64** @make_token(i64* %86, i64 %6, i64 %11)
  ret i64** %88
unreachable_29:
  br label %end_if_25
end_if_25:
  %89 = load i64**, i64*** %ptr_c
  %90 = icmp eq i64** %89, 37
  br i1 %90, label %then_30, label %end_if_31
then_30:
  %91 = call i8* @malloc(i64 8)
  %92 = bitcast i8* %91 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 0
  store i64 45, i64* %93
  %94 = call i64** @make_token(i64* %92, i64 %6, i64 %11)
  ret i64** %94
unreachable_32:
  br label %end_if_31
end_if_31:
  %95 = load i64**, i64*** %ptr_c
  %96 = icmp eq i64** %95, 61
  br i1 %96, label %then_33, label %end_if_34
then_33:
  %97 = load i64**, i64*** %ptr_lex
  %98 = call i64 @peek(i64** %97)
  %99 = icmp eq i64 %98, 61
  br i1 %99, label %then_35, label %end_if_36
then_35:
  %100 = load i64**, i64*** %ptr_lex
  %101 = call i64 @advance(i64** %100)
  %102 = call i8* @malloc(i64 8)
  %103 = bitcast i8* %102 to i64*
  %104 = getelementptr inbounds i64, i64* %103, i64 0
  store i64 35, i64* %104
  %105 = call i64** @make_token(i64* %103, i64 %6, i64 %11)
  ret i64** %105
unreachable_37:
  br label %end_if_36
end_if_36:
  %106 = call i8* @malloc(i64 8)
  %107 = bitcast i8* %106 to i64*
  %108 = getelementptr inbounds i64, i64* %107, i64 0
  store i64 30, i64* %108
  %109 = call i64** @make_token(i64* %107, i64 %6, i64 %11)
  ret i64** %109
unreachable_38:
  br label %end_if_34
end_if_34:
  %110 = load i64**, i64*** %ptr_c
  %111 = icmp eq i64** %110, 33
  br i1 %111, label %then_39, label %end_if_40
then_39:
  %112 = load i64**, i64*** %ptr_lex
  %113 = call i64 @peek(i64** %112)
  %114 = icmp eq i64 %113, 61
  br i1 %114, label %then_41, label %end_if_42
then_41:
  %115 = load i64**, i64*** %ptr_lex
  %116 = call i64 @advance(i64** %115)
  %117 = call i8* @malloc(i64 8)
  %118 = bitcast i8* %117 to i64*
  %119 = getelementptr inbounds i64, i64* %118, i64 0
  store i64 36, i64* %119
  %120 = call i64** @make_token(i64* %118, i64 %6, i64 %11)
  ret i64** %120
unreachable_43:
  br label %end_if_42
end_if_42:
  %121 = call i8* @malloc(i64 16)
  %122 = bitcast i8* %121 to i64*
  %123 = getelementptr inbounds i64, i64* %122, i64 0
  store i64 63, i64* %123
  %124 = getelementptr inbounds i64, i64* %122, i64 1
  %125 = bitcast i64* %124 to i8**
  store i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.0, i64 0, i64 0), i8** %125
  %126 = call i64** @make_token(i64* %122, i64 %6, i64 %11)
  ret i64** %126
unreachable_44:
  br label %end_if_40
end_if_40:
  %127 = load i64**, i64*** %ptr_c
  %128 = icmp eq i64** %127, 60
  br i1 %128, label %then_45, label %end_if_46
then_45:
  %129 = load i64**, i64*** %ptr_lex
  %130 = call i64 @peek(i64** %129)
  %131 = icmp eq i64 %130, 61
  br i1 %131, label %then_47, label %end_if_48
then_47:
  %132 = load i64**, i64*** %ptr_lex
  %133 = call i64 @advance(i64** %132)
  %134 = call i8* @malloc(i64 8)
  %135 = bitcast i8* %134 to i64*
  %136 = getelementptr inbounds i64, i64* %135, i64 0
  store i64 38, i64* %136
  %137 = call i64** @make_token(i64* %135, i64 %6, i64 %11)
  ret i64** %137
unreachable_49:
  br label %end_if_48
end_if_48:
  %138 = call i8* @malloc(i64 8)
  %139 = bitcast i8* %138 to i64*
  %140 = getelementptr inbounds i64, i64* %139, i64 0
  store i64 37, i64* %140
  %141 = call i64** @make_token(i64* %139, i64 %6, i64 %11)
  ret i64** %141
unreachable_50:
  br label %end_if_46
end_if_46:
  %142 = load i64**, i64*** %ptr_c
  %143 = icmp eq i64** %142, 62
  br i1 %143, label %then_51, label %end_if_52
then_51:
  %144 = load i64**, i64*** %ptr_lex
  %145 = call i64 @peek(i64** %144)
  %146 = icmp eq i64 %145, 61
  br i1 %146, label %then_53, label %end_if_54
then_53:
  %147 = load i64**, i64*** %ptr_lex
  %148 = call i64 @advance(i64** %147)
  %149 = call i8* @malloc(i64 8)
  %150 = bitcast i8* %149 to i64*
  %151 = getelementptr inbounds i64, i64* %150, i64 0
  store i64 40, i64* %151
  %152 = call i64** @make_token(i64* %150, i64 %6, i64 %11)
  ret i64** %152
unreachable_55:
  br label %end_if_54
end_if_54:
  %153 = load i64**, i64*** %ptr_lex
  %154 = call i64 @peek(i64** %153)
  %155 = icmp eq i64 %154, 62
  br i1 %155, label %then_56, label %end_if_57
then_56:
  %156 = load i64**, i64*** %ptr_lex
  %157 = call i64 @advance(i64** %156)
  %158 = call i8* @malloc(i64 8)
  %159 = bitcast i8* %158 to i64*
  %160 = getelementptr inbounds i64, i64* %159, i64 0
  store i64 46, i64* %160
  %161 = call i64** @make_token(i64* %159, i64 %6, i64 %11)
  ret i64** %161
unreachable_58:
  br label %end_if_57
end_if_57:
  %162 = call i8* @malloc(i64 8)
  %163 = bitcast i8* %162 to i64*
  %164 = getelementptr inbounds i64, i64* %163, i64 0
  store i64 39, i64* %164
  %165 = call i64** @make_token(i64* %163, i64 %6, i64 %11)
  ret i64** %165
unreachable_59:
  br label %end_if_52
end_if_52:
  %166 = load i64**, i64*** %ptr_c
  %167 = icmp eq i64** %166, 94
  br i1 %167, label %then_60, label %end_if_61
then_60:
  %168 = call i8* @malloc(i64 8)
  %169 = bitcast i8* %168 to i64*
  %170 = getelementptr inbounds i64, i64* %169, i64 0
  store i64 48, i64* %170
  %171 = call i64** @make_token(i64* %169, i64 %6, i64 %11)
  ret i64** %171
unreachable_62:
  br label %end_if_61
end_if_61:
  %172 = load i64**, i64*** %ptr_c
  %173 = icmp eq i64** %172, 63
  br i1 %173, label %then_63, label %end_if_64
then_63:
  %174 = call i8* @malloc(i64 8)
  %175 = bitcast i8* %174 to i64*
  %176 = getelementptr inbounds i64, i64* %175, i64 0
  store i64 51, i64* %176
  %177 = call i64** @make_token(i64* %175, i64 %6, i64 %11)
  ret i64** %177
unreachable_65:
  br label %end_if_64
end_if_64:
  %178 = load i64**, i64*** %ptr_c
  %179 = icmp eq i64** %178, 123
  br i1 %179, label %then_66, label %end_if_67
then_66:
  %180 = call i8* @malloc(i64 8)
  %181 = bitcast i8* %180 to i64*
  %182 = getelementptr inbounds i64, i64* %181, i64 0
  store i64 53, i64* %182
  %183 = call i64** @make_token(i64* %181, i64 %6, i64 %11)
  ret i64** %183
unreachable_68:
  br label %end_if_67
end_if_67:
  %184 = load i64**, i64*** %ptr_c
  %185 = icmp eq i64** %184, 125
  br i1 %185, label %then_69, label %end_if_70
then_69:
  %186 = call i8* @malloc(i64 8)
  %187 = bitcast i8* %186 to i64*
  %188 = getelementptr inbounds i64, i64* %187, i64 0
  store i64 54, i64* %188
  %189 = call i64** @make_token(i64* %187, i64 %6, i64 %11)
  ret i64** %189
unreachable_71:
  br label %end_if_70
end_if_70:
  %190 = load i64**, i64*** %ptr_c
  %191 = icmp eq i64** %190, 91
  br i1 %191, label %then_72, label %end_if_73
then_72:
  %192 = call i8* @malloc(i64 8)
  %193 = bitcast i8* %192 to i64*
  %194 = getelementptr inbounds i64, i64* %193, i64 0
  store i64 55, i64* %194
  %195 = call i64** @make_token(i64* %193, i64 %6, i64 %11)
  ret i64** %195
unreachable_74:
  br label %end_if_73
end_if_73:
  %196 = load i64**, i64*** %ptr_c
  %197 = icmp eq i64** %196, 93
  br i1 %197, label %then_75, label %end_if_76
then_75:
  %198 = call i8* @malloc(i64 8)
  %199 = bitcast i8* %198 to i64*
  %200 = getelementptr inbounds i64, i64* %199, i64 0
  store i64 56, i64* %200
  %201 = call i64** @make_token(i64* %199, i64 %6, i64 %11)
  ret i64** %201
unreachable_77:
  br label %end_if_76
end_if_76:
  %202 = load i64**, i64*** %ptr_c
  %203 = icmp eq i64** %202, 40
  br i1 %203, label %then_78, label %end_if_79
then_78:
  %204 = call i8* @malloc(i64 8)
  %205 = bitcast i8* %204 to i64*
  %206 = getelementptr inbounds i64, i64* %205, i64 0
  store i64 57, i64* %206
  %207 = call i64** @make_token(i64* %205, i64 %6, i64 %11)
  ret i64** %207
unreachable_80:
  br label %end_if_79
end_if_79:
  %208 = load i64**, i64*** %ptr_c
  %209 = icmp eq i64** %208, 41
  br i1 %209, label %then_81, label %end_if_82
then_81:
  %210 = call i8* @malloc(i64 8)
  %211 = bitcast i8* %210 to i64*
  %212 = getelementptr inbounds i64, i64* %211, i64 0
  store i64 58, i64* %212
  %213 = call i64** @make_token(i64* %211, i64 %6, i64 %11)
  ret i64** %213
unreachable_83:
  br label %end_if_82
end_if_82:
  %214 = load i64**, i64*** %ptr_c
  %215 = icmp eq i64** %214, 58
  br i1 %215, label %then_84, label %end_if_85
then_84:
  %216 = call i8* @malloc(i64 8)
  %217 = bitcast i8* %216 to i64*
  %218 = getelementptr inbounds i64, i64* %217, i64 0
  store i64 59, i64* %218
  %219 = call i64** @make_token(i64* %217, i64 %6, i64 %11)
  ret i64** %219
unreachable_86:
  br label %end_if_85
end_if_85:
  %220 = load i64**, i64*** %ptr_c
  %221 = icmp eq i64** %220, 44
  br i1 %221, label %then_87, label %end_if_88
then_87:
  %222 = call i8* @malloc(i64 8)
  %223 = bitcast i8* %222 to i64*
  %224 = getelementptr inbounds i64, i64* %223, i64 0
  store i64 60, i64* %224
  %225 = call i64** @make_token(i64* %223, i64 %6, i64 %11)
  ret i64** %225
unreachable_89:
  br label %end_if_88
end_if_88:
  %226 = load i64**, i64*** %ptr_c
  %227 = icmp eq i64** %226, 46
  br i1 %227, label %then_90, label %end_if_91
then_90:
  %228 = load i64**, i64*** %ptr_lex
  %229 = call i64 @peek(i64** %228)
  %230 = icmp eq i64 %229, 46
  br i1 %230, label %then_92, label %end_if_93
then_92:
  %231 = load i64**, i64*** %ptr_lex
  %232 = call i64 @advance(i64** %231)
  %233 = call i8* @malloc(i64 8)
  %234 = bitcast i8* %233 to i64*
  %235 = getelementptr inbounds i64, i64* %234, i64 0
  store i64 62, i64* %235
  %236 = call i64** @make_token(i64* %234, i64 %6, i64 %11)
  ret i64** %236
unreachable_94:
  br label %end_if_93
end_if_93:
  %237 = call i8* @malloc(i64 8)
  %238 = bitcast i8* %237 to i64*
  %239 = getelementptr inbounds i64, i64* %238, i64 0
  store i64 61, i64* %239
  %240 = call i64** @make_token(i64* %238, i64 %6, i64 %11)
  ret i64** %240
unreachable_95:
  br label %end_if_91
end_if_91:
  %241 = load i64**, i64*** %ptr_c
  %242 = icmp eq i64** %241, 34
  br i1 %242, label %then_96, label %end_if_97
then_96:
  %243 = load i64**, i64*** %ptr_lex
  %244 = bitcast i64** %243 to i64*
  %245 = getelementptr inbounds i64, i64* %244, i64 1
  %246 = bitcast i64* %245 to i64*
  %247 = load i64, i64* %246, align 8
  store i64 %247, i64* %ptr_start_pos
  br label %while_cond_98
while_cond_98:
  %248 = load i64**, i64*** %ptr_lex
  %249 = call i1 @is_at_end(i64** %248)
  %250 = xor i1 %249, 1
  %251 = load i64**, i64*** %ptr_lex
  %252 = call i64 @peek(i64** %251)
  %253 = icmp ne i64 %252, 34
  %254 = and i1 %250, %253
  br i1 %254, label %while_body_99, label %while_end_100
while_body_99:
  %255 = load i64**, i64*** %ptr_lex
  %256 = call i64 @peek(i64** %255)
  %257 = icmp eq i64 %256, 92
  br i1 %257, label %then_101, label %end_if_102
then_101:
  %258 = load i64**, i64*** %ptr_lex
  %259 = call i64 @advance(i64** %258)
  br label %end_if_102
end_if_102:
  %260 = load i64**, i64*** %ptr_lex
  %261 = call i64 @advance(i64** %260)
  br label %while_cond_98
while_end_100:
  %262 = load i64**, i64*** %ptr_lex
  %263 = call i1 @is_at_end(i64** %262)
  br i1 %263, label %then_103, label %end_if_104
then_103:
  %264 = call i8* @malloc(i64 16)
  %265 = bitcast i8* %264 to i64*
  %266 = getelementptr inbounds i64, i64* %265, i64 0
  store i64 63, i64* %266
  %267 = getelementptr inbounds i64, i64* %265, i64 1
  %268 = bitcast i64* %267 to i8**
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i8** %268
  %269 = call i64** @make_token(i64* %265, i64 %6, i64 %11)
  ret i64** %269
unreachable_105:
  br label %end_if_104
end_if_104:
  %270 = load i64**, i64*** %ptr_lex
  %271 = bitcast i64** %270 to i64*
  %272 = getelementptr inbounds i64, i64* %271, i64 1
  %273 = bitcast i64* %272 to i64*
  %274 = load i64, i64* %273, align 8
  store i64 %274, i64* %ptr_end_pos
  %275 = load i64**, i64*** %ptr_lex
  %276 = call i64 @advance(i64** %275)
  %277 = load i64**, i64*** %ptr_lex
  %278 = bitcast i64** %277 to i64*
  %279 = getelementptr inbounds i64, i64* %278, i64 0
  %280 = bitcast i64* %279 to i8**
  %281 = load i8*, i8** %280, align 8
  %282 = load i64, i64* %ptr_start_pos
  %283 = load i64, i64* %ptr_end_pos
  %284 = sub nsw i64 %283, %282
  %285 = add nsw i64 %284, 1
  %286 = call i8* @malloc(i64 %285)
  %287 = getelementptr inbounds i8, i8* %281, i64 %282
  %288 = call i8* @strncpy(i8* %286, i8* %287, i64 %284)
  %289 = getelementptr inbounds i8, i8* %286, i64 %284
  store i8 0, i8* %289, align 1
  store i8* %286, i8** %ptr_str_val
  %290 = call i8* @malloc(i64 16)
  %291 = bitcast i8* %290 to i64*
  %292 = getelementptr inbounds i64, i64* %291, i64 0
  store i64 28, i64* %292
  %293 = load i8*, i8** %ptr_str_val
  %294 = getelementptr inbounds i64, i64* %291, i64 1
  %295 = bitcast i64* %294 to i8**
  store i8* %293, i8** %295
  %296 = call i64** @make_token(i64* %291, i64 %6, i64 %11)
  ret i64** %296
unreachable_106:
  br label %end_if_97
end_if_97:
  %297 = load i64**, i64*** %ptr_c
  %298 = icmp eq i64** %297, 39
  br i1 %298, label %then_107, label %end_if_108
then_107:
  %299 = load i64**, i64*** %ptr_lex
  %300 = call i1 @is_at_end(i64** %299)
  br i1 %300, label %then_109, label %end_if_110
then_109:
  %301 = call i8* @malloc(i64 16)
  %302 = bitcast i8* %301 to i64*
  %303 = getelementptr inbounds i64, i64* %302, i64 0
  store i64 63, i64* %303
  %304 = getelementptr inbounds i64, i64* %302, i64 1
  %305 = bitcast i64* %304 to i8**
  store i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8** %305
  %306 = call i64** @make_token(i64* %302, i64 %6, i64 %11)
  ret i64** %306
unreachable_111:
  br label %end_if_110
end_if_110:
  %307 = load i64**, i64*** %ptr_lex
  %308 = call i64 @advance(i64** %307)
  store i64 %308, i64* %ptr_char_val
  %309 = load i64, i64* %ptr_char_val
  %310 = icmp eq i64 %309, 92
  br i1 %310, label %then_112, label %end_if_113
then_112:
  %311 = load i64**, i64*** %ptr_lex
  %312 = call i1 @is_at_end(i64** %311)
  br i1 %312, label %then_114, label %end_if_115
then_114:
  %313 = call i8* @malloc(i64 16)
  %314 = bitcast i8* %313 to i64*
  %315 = getelementptr inbounds i64, i64* %314, i64 0
  store i64 63, i64* %315
  %316 = getelementptr inbounds i64, i64* %314, i64 1
  %317 = bitcast i64* %316 to i8**
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0), i8** %317
  %318 = call i64** @make_token(i64* %314, i64 %6, i64 %11)
  ret i64** %318
unreachable_116:
  br label %end_if_115
end_if_115:
  %319 = load i64**, i64*** %ptr_lex
  %320 = call i64 @advance(i64** %319)
  store i64 %320, i64* %ptr_esc
  %321 = load i64, i64* %ptr_esc
  %322 = icmp eq i64 %321, 110
  br i1 %322, label %then_117, label %end_if_118
then_117:
  store i64 10, i64* %ptr_char_val
  br label %end_if_118
end_if_118:
  %323 = load i64, i64* %ptr_esc
  %324 = icmp eq i64 %323, 114
  br i1 %324, label %then_119, label %end_if_120
then_119:
  store i64 13, i64* %ptr_char_val
  br label %end_if_120
end_if_120:
  %325 = load i64, i64* %ptr_esc
  %326 = icmp eq i64 %325, 116
  br i1 %326, label %then_121, label %end_if_122
then_121:
  store i64 9, i64* %ptr_char_val
  br label %end_if_122
end_if_122:
  %327 = load i64, i64* %ptr_esc
  %328 = icmp eq i64 %327, 92
  br i1 %328, label %then_123, label %end_if_124
then_123:
  store i64 92, i64* %ptr_char_val
  br label %end_if_124
end_if_124:
  %329 = load i64, i64* %ptr_esc
  %330 = icmp eq i64 %329, 34
  br i1 %330, label %then_125, label %end_if_126
then_125:
  store i64 34, i64* %ptr_char_val
  br label %end_if_126
end_if_126:
  %331 = load i64, i64* %ptr_esc
  %332 = icmp eq i64 %331, 39
  br i1 %332, label %then_127, label %end_if_128
then_127:
  store i64 39, i64* %ptr_char_val
  br label %end_if_128
end_if_128:
  %333 = load i64, i64* %ptr_esc
  %334 = icmp eq i64 %333, 48
  br i1 %334, label %then_129, label %end_if_130
then_129:
  store i64 0, i64* %ptr_char_val
  br label %end_if_130
end_if_130:
  %335 = load i64, i64* %ptr_esc
  %336 = icmp ne i64 %335, 110
  %337 = load i64, i64* %ptr_esc
  %338 = icmp ne i64 %337, 114
  %339 = and i1 %336, %338
  %340 = load i64, i64* %ptr_esc
  %341 = icmp ne i64 %340, 116
  %342 = and i1 %339, %341
  %343 = load i64, i64* %ptr_esc
  %344 = icmp ne i64 %343, 92
  %345 = and i1 %342, %344
  %346 = load i64, i64* %ptr_esc
  %347 = icmp ne i64 %346, 34
  %348 = and i1 %345, %347
  %349 = load i64, i64* %ptr_esc
  %350 = icmp ne i64 %349, 39
  %351 = and i1 %348, %350
  %352 = load i64, i64* %ptr_esc
  %353 = icmp ne i64 %352, 48
  %354 = and i1 %351, %353
  br i1 %354, label %then_131, label %end_if_132
then_131:
  %355 = call i8* @malloc(i64 16)
  %356 = bitcast i8* %355 to i64*
  %357 = getelementptr inbounds i64, i64* %356, i64 0
  store i64 63, i64* %357
  %358 = getelementptr inbounds i64, i64* %356, i64 1
  %359 = bitcast i64* %358 to i8**
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i64 0, i64 0), i8** %359
  %360 = call i64** @make_token(i64* %356, i64 %6, i64 %11)
  ret i64** %360
unreachable_133:
  br label %end_if_132
end_if_132:
  br label %end_if_113
end_if_113:
  %361 = load i64**, i64*** %ptr_lex
  %362 = call i64 @peek(i64** %361)
  %363 = icmp eq i64 %362, 39
  br i1 %363, label %then_134, label %end_if_135
then_134:
  %364 = load i64**, i64*** %ptr_lex
  %365 = call i64 @advance(i64** %364)
  %366 = call i8* @malloc(i64 16)
  %367 = bitcast i8* %366 to i64*
  %368 = getelementptr inbounds i64, i64* %367, i64 0
  store i64 29, i64* %368
  %369 = load i64, i64* %ptr_char_val
  %370 = getelementptr inbounds i64, i64* %367, i64 1
  %371 = bitcast i64* %370 to i64*
  store i64 %369, i64* %371
  %372 = call i64** @make_token(i64* %367, i64 %6, i64 %11)
  ret i64** %372
unreachable_136:
  br label %end_if_135
end_if_135:
  %373 = call i8* @malloc(i64 16)
  %374 = bitcast i8* %373 to i64*
  %375 = getelementptr inbounds i64, i64* %374, i64 0
  store i64 63, i64* %375
  %376 = getelementptr inbounds i64, i64* %374, i64 1
  %377 = bitcast i64* %376 to i8**
  store i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i64 0, i64 0), i8** %377
  %378 = call i64** @make_token(i64* %374, i64 %6, i64 %11)
  ret i64** %378
unreachable_137:
  br label %end_if_108
end_if_108:
  %379 = load i64**, i64*** %ptr_c
  %380 = call i1 @is_alpha(i64** %379)
  br i1 %380, label %then_138, label %end_if_139
then_138:
  %381 = load i64**, i64*** %ptr_lex
  %382 = bitcast i64** %381 to i64*
  %383 = getelementptr inbounds i64, i64* %382, i64 1
  %384 = bitcast i64* %383 to i64*
  %385 = load i64, i64* %384, align 8
  %386 = sub nsw i64 %385, 1
  store i64 %386, i64* %ptr_start_pos
  br label %while_cond_140
while_cond_140:
  %387 = load i64**, i64*** %ptr_lex
  %388 = call i64 @peek(i64** %387)
  %389 = call i1 @is_alphanumeric(i64 %388)
  br i1 %389, label %while_body_141, label %while_end_142
while_body_141:
  %390 = load i64**, i64*** %ptr_lex
  %391 = call i64 @advance(i64** %390)
  br label %while_cond_140
while_end_142:
  %392 = load i64**, i64*** %ptr_lex
  %393 = bitcast i64** %392 to i64*
  %394 = getelementptr inbounds i64, i64* %393, i64 0
  %395 = bitcast i64* %394 to i8**
  %396 = load i8*, i8** %395, align 8
  %397 = load i64**, i64*** %ptr_lex
  %398 = bitcast i64** %397 to i64*
  %399 = getelementptr inbounds i64, i64* %398, i64 1
  %400 = bitcast i64* %399 to i64*
  %401 = load i64, i64* %400, align 8
  %402 = load i64, i64* %ptr_start_pos
  %403 = sub nsw i64 %401, %402
  %404 = add nsw i64 %403, 1
  %405 = call i8* @malloc(i64 %404)
  %406 = getelementptr inbounds i8, i8* %396, i64 %402
  %407 = call i8* @strncpy(i8* %405, i8* %406, i64 %403)
  %408 = getelementptr inbounds i8, i8* %405, i64 %403
  store i8 0, i8* %408, align 1
  store i8* %405, i8** %ptr_ident
  %409 = load i8*, i8** %ptr_ident
  %410 = call i32 @strcmp(i8* %409, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0))
  %411 = icmp eq i32 %410, 0
  br i1 %411, label %then_143, label %end_if_144
then_143:
  %412 = call i8* @malloc(i64 8)
  %413 = bitcast i8* %412 to i64*
  %414 = getelementptr inbounds i64, i64* %413, i64 0
  store i64 0, i64* %414
  %415 = call i64** @make_token(i64* %413, i64 %6, i64 %11)
  ret i64** %415
unreachable_145:
  br label %end_if_144
end_if_144:
  %416 = load i8*, i8** %ptr_ident
  %417 = call i32 @strcmp(i8* %416, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0))
  %418 = icmp eq i32 %417, 0
  br i1 %418, label %then_146, label %end_if_147
then_146:
  %419 = call i8* @malloc(i64 8)
  %420 = bitcast i8* %419 to i64*
  %421 = getelementptr inbounds i64, i64* %420, i64 0
  store i64 1, i64* %421
  %422 = call i64** @make_token(i64* %420, i64 %6, i64 %11)
  ret i64** %422
unreachable_148:
  br label %end_if_147
end_if_147:
  %423 = load i8*, i8** %ptr_ident
  %424 = call i32 @strcmp(i8* %423, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0))
  %425 = icmp eq i32 %424, 0
  br i1 %425, label %then_149, label %end_if_150
then_149:
  %426 = call i8* @malloc(i64 8)
  %427 = bitcast i8* %426 to i64*
  %428 = getelementptr inbounds i64, i64* %427, i64 0
  store i64 2, i64* %428
  %429 = call i64** @make_token(i64* %427, i64 %6, i64 %11)
  ret i64** %429
unreachable_151:
  br label %end_if_150
end_if_150:
  %430 = load i8*, i8** %ptr_ident
  %431 = call i32 @strcmp(i8* %430, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0))
  %432 = icmp eq i32 %431, 0
  br i1 %432, label %then_152, label %end_if_153
then_152:
  %433 = call i8* @malloc(i64 8)
  %434 = bitcast i8* %433 to i64*
  %435 = getelementptr inbounds i64, i64* %434, i64 0
  store i64 3, i64* %435
  %436 = call i64** @make_token(i64* %434, i64 %6, i64 %11)
  ret i64** %436
unreachable_154:
  br label %end_if_153
end_if_153:
  %437 = load i8*, i8** %ptr_ident
  %438 = call i32 @strcmp(i8* %437, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0))
  %439 = icmp eq i32 %438, 0
  br i1 %439, label %then_155, label %end_if_156
then_155:
  %440 = call i8* @malloc(i64 8)
  %441 = bitcast i8* %440 to i64*
  %442 = getelementptr inbounds i64, i64* %441, i64 0
  store i64 4, i64* %442
  %443 = call i64** @make_token(i64* %441, i64 %6, i64 %11)
  ret i64** %443
unreachable_157:
  br label %end_if_156
end_if_156:
  %444 = load i8*, i8** %ptr_ident
  %445 = call i32 @strcmp(i8* %444, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i64 0, i64 0))
  %446 = icmp eq i32 %445, 0
  br i1 %446, label %then_158, label %end_if_159
then_158:
  %447 = call i8* @malloc(i64 8)
  %448 = bitcast i8* %447 to i64*
  %449 = getelementptr inbounds i64, i64* %448, i64 0
  store i64 5, i64* %449
  %450 = call i64** @make_token(i64* %448, i64 %6, i64 %11)
  ret i64** %450
unreachable_160:
  br label %end_if_159
end_if_159:
  %451 = load i8*, i8** %ptr_ident
  %452 = call i32 @strcmp(i8* %451, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0))
  %453 = icmp eq i32 %452, 0
  br i1 %453, label %then_161, label %end_if_162
then_161:
  %454 = call i8* @malloc(i64 8)
  %455 = bitcast i8* %454 to i64*
  %456 = getelementptr inbounds i64, i64* %455, i64 0
  store i64 6, i64* %456
  %457 = call i64** @make_token(i64* %455, i64 %6, i64 %11)
  ret i64** %457
unreachable_163:
  br label %end_if_162
end_if_162:
  %458 = load i8*, i8** %ptr_ident
  %459 = call i32 @strcmp(i8* %458, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0))
  %460 = icmp eq i32 %459, 0
  br i1 %460, label %then_164, label %end_if_165
then_164:
  %461 = call i8* @malloc(i64 8)
  %462 = bitcast i8* %461 to i64*
  %463 = getelementptr inbounds i64, i64* %462, i64 0
  store i64 7, i64* %463
  %464 = call i64** @make_token(i64* %462, i64 %6, i64 %11)
  ret i64** %464
unreachable_166:
  br label %end_if_165
end_if_165:
  %465 = load i8*, i8** %ptr_ident
  %466 = call i32 @strcmp(i8* %465, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0))
  %467 = icmp eq i32 %466, 0
  br i1 %467, label %then_167, label %end_if_168
then_167:
  %468 = call i8* @malloc(i64 8)
  %469 = bitcast i8* %468 to i64*
  %470 = getelementptr inbounds i64, i64* %469, i64 0
  store i64 8, i64* %470
  %471 = call i64** @make_token(i64* %469, i64 %6, i64 %11)
  ret i64** %471
unreachable_169:
  br label %end_if_168
end_if_168:
  %472 = load i8*, i8** %ptr_ident
  %473 = call i32 @strcmp(i8* %472, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0))
  %474 = icmp eq i32 %473, 0
  br i1 %474, label %then_170, label %end_if_171
then_170:
  %475 = call i8* @malloc(i64 8)
  %476 = bitcast i8* %475 to i64*
  %477 = getelementptr inbounds i64, i64* %476, i64 0
  store i64 9, i64* %477
  %478 = call i64** @make_token(i64* %476, i64 %6, i64 %11)
  ret i64** %478
unreachable_172:
  br label %end_if_171
end_if_171:
  %479 = load i8*, i8** %ptr_ident
  %480 = call i32 @strcmp(i8* %479, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i64 0, i64 0))
  %481 = icmp eq i32 %480, 0
  br i1 %481, label %then_173, label %end_if_174
then_173:
  %482 = call i8* @malloc(i64 8)
  %483 = bitcast i8* %482 to i64*
  %484 = getelementptr inbounds i64, i64* %483, i64 0
  store i64 10, i64* %484
  %485 = call i64** @make_token(i64* %483, i64 %6, i64 %11)
  ret i64** %485
unreachable_175:
  br label %end_if_174
end_if_174:
  %486 = load i8*, i8** %ptr_ident
  %487 = call i32 @strcmp(i8* %486, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i64 0, i64 0))
  %488 = icmp eq i32 %487, 0
  br i1 %488, label %then_176, label %end_if_177
then_176:
  %489 = call i8* @malloc(i64 8)
  %490 = bitcast i8* %489 to i64*
  %491 = getelementptr inbounds i64, i64* %490, i64 0
  store i64 11, i64* %491
  %492 = call i64** @make_token(i64* %490, i64 %6, i64 %11)
  ret i64** %492
unreachable_178:
  br label %end_if_177
end_if_177:
  %493 = load i8*, i8** %ptr_ident
  %494 = call i32 @strcmp(i8* %493, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.18, i64 0, i64 0))
  %495 = icmp eq i32 %494, 0
  br i1 %495, label %then_179, label %end_if_180
then_179:
  %496 = call i8* @malloc(i64 8)
  %497 = bitcast i8* %496 to i64*
  %498 = getelementptr inbounds i64, i64* %497, i64 0
  store i64 12, i64* %498
  %499 = call i64** @make_token(i64* %497, i64 %6, i64 %11)
  ret i64** %499
unreachable_181:
  br label %end_if_180
end_if_180:
  %500 = load i8*, i8** %ptr_ident
  %501 = call i32 @strcmp(i8* %500, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i64 0, i64 0))
  %502 = icmp eq i32 %501, 0
  br i1 %502, label %then_182, label %end_if_183
then_182:
  %503 = call i8* @malloc(i64 8)
  %504 = bitcast i8* %503 to i64*
  %505 = getelementptr inbounds i64, i64* %504, i64 0
  store i64 13, i64* %505
  %506 = call i64** @make_token(i64* %504, i64 %6, i64 %11)
  ret i64** %506
unreachable_184:
  br label %end_if_183
end_if_183:
  %507 = load i8*, i8** %ptr_ident
  %508 = call i32 @strcmp(i8* %507, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i64 0, i64 0))
  %509 = icmp eq i32 %508, 0
  br i1 %509, label %then_185, label %end_if_186
then_185:
  %510 = call i8* @malloc(i64 8)
  %511 = bitcast i8* %510 to i64*
  %512 = getelementptr inbounds i64, i64* %511, i64 0
  store i64 14, i64* %512
  %513 = call i64** @make_token(i64* %511, i64 %6, i64 %11)
  ret i64** %513
unreachable_187:
  br label %end_if_186
end_if_186:
  %514 = load i8*, i8** %ptr_ident
  %515 = call i32 @strcmp(i8* %514, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i64 0, i64 0))
  %516 = icmp eq i32 %515, 0
  br i1 %516, label %then_188, label %end_if_189
then_188:
  %517 = call i8* @malloc(i64 8)
  %518 = bitcast i8* %517 to i64*
  %519 = getelementptr inbounds i64, i64* %518, i64 0
  store i64 15, i64* %519
  %520 = call i64** @make_token(i64* %518, i64 %6, i64 %11)
  ret i64** %520
unreachable_190:
  br label %end_if_189
end_if_189:
  %521 = load i8*, i8** %ptr_ident
  %522 = call i32 @strcmp(i8* %521, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i64 0, i64 0))
  %523 = icmp eq i32 %522, 0
  br i1 %523, label %then_191, label %end_if_192
then_191:
  %524 = call i8* @malloc(i64 8)
  %525 = bitcast i8* %524 to i64*
  %526 = getelementptr inbounds i64, i64* %525, i64 0
  store i64 49, i64* %526
  %527 = call i64** @make_token(i64* %525, i64 %6, i64 %11)
  ret i64** %527
unreachable_193:
  br label %end_if_192
end_if_192:
  %528 = load i8*, i8** %ptr_ident
  %529 = call i32 @strcmp(i8* %528, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i64 0, i64 0))
  %530 = icmp eq i32 %529, 0
  br i1 %530, label %then_194, label %end_if_195
then_194:
  %531 = call i8* @malloc(i64 8)
  %532 = bitcast i8* %531 to i64*
  %533 = getelementptr inbounds i64, i64* %532, i64 0
  store i64 50, i64* %533
  %534 = call i64** @make_token(i64* %532, i64 %6, i64 %11)
  ret i64** %534
unreachable_196:
  br label %end_if_195
end_if_195:
  %535 = load i8*, i8** %ptr_ident
  %536 = call i32 @strcmp(i8* %535, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i64 0, i64 0))
  %537 = icmp eq i32 %536, 0
  br i1 %537, label %then_197, label %end_if_198
then_197:
  %538 = call i8* @malloc(i64 8)
  %539 = bitcast i8* %538 to i64*
  %540 = getelementptr inbounds i64, i64* %539, i64 0
  store i64 52, i64* %540
  %541 = call i64** @make_token(i64* %539, i64 %6, i64 %11)
  ret i64** %541
unreachable_199:
  br label %end_if_198
end_if_198:
  %542 = load i8*, i8** %ptr_ident
  %543 = call i32 @strcmp(i8* %542, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.25, i64 0, i64 0))
  %544 = icmp eq i32 %543, 0
  br i1 %544, label %then_200, label %end_if_201
then_200:
  %545 = call i8* @malloc(i64 8)
  %546 = bitcast i8* %545 to i64*
  %547 = getelementptr inbounds i64, i64* %546, i64 0
  store i64 16, i64* %547
  %548 = call i64** @make_token(i64* %546, i64 %6, i64 %11)
  ret i64** %548
unreachable_202:
  br label %end_if_201
end_if_201:
  %549 = load i8*, i8** %ptr_ident
  %550 = call i32 @strcmp(i8* %549, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i64 0, i64 0))
  %551 = icmp eq i32 %550, 0
  br i1 %551, label %then_203, label %end_if_204
then_203:
  %552 = call i8* @malloc(i64 8)
  %553 = bitcast i8* %552 to i64*
  %554 = getelementptr inbounds i64, i64* %553, i64 0
  store i64 17, i64* %554
  %555 = call i64** @make_token(i64* %553, i64 %6, i64 %11)
  ret i64** %555
unreachable_205:
  br label %end_if_204
end_if_204:
  %556 = load i8*, i8** %ptr_ident
  %557 = call i32 @strcmp(i8* %556, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i64 0, i64 0))
  %558 = icmp eq i32 %557, 0
  br i1 %558, label %then_206, label %end_if_207
then_206:
  %559 = call i8* @malloc(i64 8)
  %560 = bitcast i8* %559 to i64*
  %561 = getelementptr inbounds i64, i64* %560, i64 0
  store i64 18, i64* %561
  %562 = call i64** @make_token(i64* %560, i64 %6, i64 %11)
  ret i64** %562
unreachable_208:
  br label %end_if_207
end_if_207:
  %563 = load i8*, i8** %ptr_ident
  %564 = call i32 @strcmp(i8* %563, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.28, i64 0, i64 0))
  %565 = icmp eq i32 %564, 0
  br i1 %565, label %then_209, label %end_if_210
then_209:
  %566 = call i8* @malloc(i64 8)
  %567 = bitcast i8* %566 to i64*
  %568 = getelementptr inbounds i64, i64* %567, i64 0
  store i64 19, i64* %568
  %569 = call i64** @make_token(i64* %567, i64 %6, i64 %11)
  ret i64** %569
unreachable_211:
  br label %end_if_210
end_if_210:
  %570 = load i8*, i8** %ptr_ident
  %571 = call i32 @strcmp(i8* %570, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i64 0, i64 0))
  %572 = icmp eq i32 %571, 0
  br i1 %572, label %then_212, label %end_if_213
then_212:
  %573 = call i8* @malloc(i64 8)
  %574 = bitcast i8* %573 to i64*
  %575 = getelementptr inbounds i64, i64* %574, i64 0
  store i64 20, i64* %575
  %576 = call i64** @make_token(i64* %574, i64 %6, i64 %11)
  ret i64** %576
unreachable_214:
  br label %end_if_213
end_if_213:
  %577 = load i8*, i8** %ptr_ident
  %578 = call i32 @strcmp(i8* %577, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i64 0, i64 0))
  %579 = icmp eq i32 %578, 0
  br i1 %579, label %then_215, label %end_if_216
then_215:
  %580 = call i8* @malloc(i64 8)
  %581 = bitcast i8* %580 to i64*
  %582 = getelementptr inbounds i64, i64* %581, i64 0
  store i64 21, i64* %582
  %583 = call i64** @make_token(i64* %581, i64 %6, i64 %11)
  ret i64** %583
unreachable_217:
  br label %end_if_216
end_if_216:
  %584 = load i8*, i8** %ptr_ident
  %585 = call i32 @strcmp(i8* %584, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.31, i64 0, i64 0))
  %586 = icmp eq i32 %585, 0
  br i1 %586, label %then_218, label %end_if_219
then_218:
  %587 = call i8* @malloc(i64 8)
  %588 = bitcast i8* %587 to i64*
  %589 = getelementptr inbounds i64, i64* %588, i64 0
  store i64 22, i64* %589
  %590 = call i64** @make_token(i64* %588, i64 %6, i64 %11)
  ret i64** %590
unreachable_220:
  br label %end_if_219
end_if_219:
  %591 = load i8*, i8** %ptr_ident
  %592 = call i32 @strcmp(i8* %591, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i64 0, i64 0))
  %593 = icmp eq i32 %592, 0
  br i1 %593, label %then_221, label %end_if_222
then_221:
  %594 = call i8* @malloc(i64 8)
  %595 = bitcast i8* %594 to i64*
  %596 = getelementptr inbounds i64, i64* %595, i64 0
  store i64 23, i64* %596
  %597 = call i64** @make_token(i64* %595, i64 %6, i64 %11)
  ret i64** %597
unreachable_223:
  br label %end_if_222
end_if_222:
  %598 = load i8*, i8** %ptr_ident
  %599 = call i32 @strcmp(i8* %598, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i64 0, i64 0))
  %600 = icmp eq i32 %599, 0
  br i1 %600, label %then_224, label %end_if_225
then_224:
  %601 = call i8* @malloc(i64 8)
  %602 = bitcast i8* %601 to i64*
  %603 = getelementptr inbounds i64, i64* %602, i64 0
  store i64 24, i64* %603
  %604 = call i64** @make_token(i64* %602, i64 %6, i64 %11)
  ret i64** %604
unreachable_226:
  br label %end_if_225
end_if_225:
  %605 = call i8* @malloc(i64 16)
  %606 = bitcast i8* %605 to i64*
  %607 = getelementptr inbounds i64, i64* %606, i64 0
  store i64 25, i64* %607
  %608 = load i8*, i8** %ptr_ident
  %609 = getelementptr inbounds i64, i64* %606, i64 1
  %610 = bitcast i64* %609 to i8**
  store i8* %608, i8** %610
  %611 = call i64** @make_token(i64* %606, i64 %6, i64 %11)
  ret i64** %611
unreachable_227:
  br label %end_if_139
end_if_139:
  %612 = load i64**, i64*** %ptr_c
  %613 = call i1 @is_digit(i64** %612)
  br i1 %613, label %then_228, label %end_if_229
then_228:
  %614 = load i64**, i64*** %ptr_c
  %615 = sub nsw i64** %614, 48
  store i64** %615, i64* %ptr_val_int
  store i1 0, i1* %ptr_is_float
  store double 0.0, double* %ptr_val_float
  store double 0.1, double* %ptr_fractional_mult
  br label %while_cond_230
while_cond_230:
  %616 = load i64**, i64*** %ptr_lex
  %617 = call i1 @is_at_end(i64** %616)
  %618 = xor i1 %617, 1
  br i1 %618, label %while_body_231, label %while_end_232
while_body_231:
  %619 = load i64**, i64*** %ptr_lex
  %620 = call i64 @peek(i64** %619)
  store i64 %620, i64* %ptr_next_c
  store i1 0, i1* %ptr_matched
  %621 = load i64, i64* %ptr_next_c
  %622 = call i1 @is_digit(i64 %621)
  br i1 %622, label %then_233, label %end_if_234
then_233:
  %623 = load i64**, i64*** %ptr_lex
  %624 = call i64 @advance(i64** %623)
  %625 = load i1, i1* %ptr_is_float
  br i1 %625, label %then_235, label %end_if_236
then_235:
  %626 = load i64, i64* %ptr_next_c
  %627 = sub nsw i64 %626, 48
  store i64 %627, i64* %ptr_digit_val
  %628 = load i64, i64* %ptr_digit_val
  %629 = sitofp i64 %628 to double
  %630 = load double, double* %ptr_fractional_mult
  %631 = fmul double %629, %630
  %632 = load double, double* %ptr_val_float
  %633 = fadd double %632, %631
  store double %633, double* %ptr_val_float
  %634 = load double, double* %ptr_fractional_mult
  %635 = fmul double %634, 0.1
  store double %635, double* %ptr_fractional_mult
  br label %end_if_236
end_if_236:
  %636 = load i1, i1* %ptr_is_float
  %637 = xor i1 %636, 1
  br i1 %637, label %then_237, label %end_if_238
then_237:
  %638 = load i64, i64* %ptr_next_c
  %639 = sub nsw i64 %638, 48
  store i64 %639, i64* %ptr_digit_val
  %640 = load i64, i64* %ptr_val_int
  %641 = mul nsw i64 %640, 10
  %642 = load i64, i64* %ptr_digit_val
  %643 = add nsw i64 %641, %642
  store i64 %643, i64* %ptr_val_int
  br label %end_if_238
end_if_238:
  store i1 1, i1* %ptr_matched
  br label %end_if_234
end_if_234:
  %644 = load i1, i1* %ptr_matched
  %645 = xor i1 %644, 1
  br i1 %645, label %then_239, label %end_if_240
then_239:
  %646 = load i64, i64* %ptr_next_c
  %647 = icmp eq i64 %646, 46
  br i1 %647, label %then_241, label %end_if_242
then_241:
  %648 = load i1, i1* %ptr_is_float
  br i1 %648, label %then_243, label %end_if_244
then_243:
  br label %while_end_232
unreachable_245:
  br label %end_if_244
end_if_244:
  %649 = load i64**, i64*** %ptr_lex
  %650 = call i64 @peek_next(i64** %649)
  %651 = icmp eq i64 %650, 46
  br i1 %651, label %then_246, label %end_if_247
then_246:
  br label %while_end_232
unreachable_248:
  br label %end_if_247
end_if_247:
  %652 = load i64**, i64*** %ptr_lex
  %653 = call i64 @advance(i64** %652)
  store i1 1, i1* %ptr_is_float
  %654 = load i64, i64* %ptr_val_int
  %655 = sitofp i64 %654 to double
  store double %655, double* %ptr_val_float
  store i1 1, i1* %ptr_matched
  br label %end_if_242
end_if_242:
  br label %end_if_240
end_if_240:
  %656 = load i1, i1* %ptr_matched
  %657 = xor i1 %656, 1
  br i1 %657, label %then_249, label %end_if_250
then_249:
  br label %while_end_232
unreachable_251:
  br label %end_if_250
end_if_250:
  br label %while_cond_230
while_end_232:
  %658 = load i1, i1* %ptr_is_float
  br i1 %658, label %then_252, label %end_if_253
then_252:
  %659 = call i8* @malloc(i64 16)
  %660 = bitcast i8* %659 to i64*
  %661 = getelementptr inbounds i64, i64* %660, i64 0
  store i64 27, i64* %661
  %662 = load double, double* %ptr_val_float
  %663 = getelementptr inbounds i64, i64* %660, i64 1
  %664 = bitcast i64* %663 to double*
  store double %662, double* %664
  %665 = call i64** @make_token(i64* %660, i64 %6, i64 %11)
  ret i64** %665
unreachable_254:
  br label %end_if_253
end_if_253:
  %666 = call i8* @malloc(i64 16)
  %667 = bitcast i8* %666 to i64*
  %668 = getelementptr inbounds i64, i64* %667, i64 0
  store i64 26, i64* %668
  %669 = load i64, i64* %ptr_val_int
  %670 = getelementptr inbounds i64, i64* %667, i64 1
  %671 = bitcast i64* %670 to i64*
  store i64 %669, i64* %671
  %672 = call i64** @make_token(i64* %667, i64 %6, i64 %11)
  ret i64** %672
unreachable_255:
  br label %end_if_229
end_if_229:
  %673 = call i8* @malloc(i64 16)
  %674 = bitcast i8* %673 to i64*
  %675 = getelementptr inbounds i64, i64* %674, i64 0
  store i64 63, i64* %675
  %676 = getelementptr inbounds i64, i64* %674, i64 1
  %677 = bitcast i64* %676 to i8**
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.34, i64 0, i64 0), i8** %677
  %678 = call i64** @make_token(i64* %674, i64 %6, i64 %11)
  ret i64** %678
unreachable_256:
  ret i64** null
}

define void @print_string(i64** noalias %param_value) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_value, i64*** %ptr_value
  %1 = load i64**, i64*** %ptr_value
  %2 = call i64 @puts(i64** %1)
  ret void
}

define i64** @alloc_span(i64 %start_line, i64 %start_col, i64 %end_line, i64 %end_col) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  %1 = call i8* @malloc(i64 32)
  %2 = bitcast i8* %1 to i64*
  %3 = bitcast i64* %2 to i64*
  %4 = getelementptr inbounds i64, i64* %3, i64 0
  %5 = bitcast i64* %4 to i64*
  store i64 %start_line, i64* %5, align 8
  %6 = bitcast i64* %2 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  store i64 %start_col, i64* %8, align 8
  %9 = bitcast i64* %2 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 2
  %11 = bitcast i64* %10 to i64*
  store i64 %end_line, i64* %11, align 8
  %12 = bitcast i64* %2 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 3
  %14 = bitcast i64* %13 to i64*
  store i64 %end_col, i64* %14, align 8
  ret i64* %2
unreachable_0:
  ret i64** null
}

define i64** @merge_span(i64** noalias %param_a, i64** noalias %param_b) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_a, i64*** %ptr_a
  store i64** %param_b, i64*** %ptr_b
  %1 = load i64**, i64*** %ptr_a
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_b
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = load i64**, i64*** %ptr_a
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i64*
  %15 = load i64, i64* %14, align 8
  %16 = icmp slt i64 %10, %15
  br i1 %16, label %then_0, label %end_if_1
then_0:
  %17 = load i64**, i64*** %ptr_b
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i64*
  %21 = load i64, i64* %20, align 8
  store i64 %21, i64 %5
  br label %end_if_1
end_if_1:
  %22 = load i64**, i64*** %ptr_a
  %23 = bitcast i64** %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 1
  %25 = bitcast i64* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = load i64**, i64*** %ptr_a
  %28 = bitcast i64** %27 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 0
  %30 = bitcast i64* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = load i64**, i64*** %ptr_b
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 0
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp eq i64 %31, %36
  br i1 %37, label %then_2, label %end_if_3
then_2:
  %38 = load i64**, i64*** %ptr_b
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 1
  %41 = bitcast i64* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = load i64**, i64*** %ptr_a
  %44 = bitcast i64** %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 1
  %46 = bitcast i64* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = icmp slt i64 %42, %47
  br i1 %48, label %then_4, label %end_if_5
then_4:
  %49 = load i64**, i64*** %ptr_b
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 1
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  store i64 %53, i64 %26
  br label %end_if_5
end_if_5:
  br label %end_if_3
end_if_3:
  %54 = load i64**, i64*** %ptr_b
  %55 = bitcast i64** %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = load i64**, i64*** %ptr_a
  %60 = bitcast i64** %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  %62 = bitcast i64* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = icmp slt i64 %58, %63
  br i1 %64, label %then_6, label %end_if_7
then_6:
  %65 = load i64**, i64*** %ptr_b
  %66 = bitcast i64** %65 to i64*
  %67 = getelementptr inbounds i64, i64* %66, i64 1
  %68 = bitcast i64* %67 to i64*
  %69 = load i64, i64* %68, align 8
  store i64 %69, i64 %26
  br label %end_if_7
end_if_7:
  %70 = load i64**, i64*** %ptr_a
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = load i64**, i64*** %ptr_b
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 2
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64**, i64*** %ptr_a
  %81 = bitcast i64** %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 2
  %83 = bitcast i64* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = icmp sgt i64 %79, %84
  br i1 %85, label %then_8, label %end_if_9
then_8:
  %86 = load i64**, i64*** %ptr_b
  %87 = bitcast i64** %86 to i64*
  %88 = getelementptr inbounds i64, i64* %87, i64 2
  %89 = bitcast i64* %88 to i64*
  %90 = load i64, i64* %89, align 8
  store i64 %90, i64 %74
  br label %end_if_9
end_if_9:
  %91 = load i64**, i64*** %ptr_a
  %92 = bitcast i64** %91 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 3
  %94 = bitcast i64* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = load i64**, i64*** %ptr_a
  %97 = bitcast i64** %96 to i64*
  %98 = getelementptr inbounds i64, i64* %97, i64 2
  %99 = bitcast i64* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = load i64**, i64*** %ptr_b
  %102 = bitcast i64** %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 2
  %104 = bitcast i64* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = icmp eq i64 %100, %105
  br i1 %106, label %then_10, label %end_if_11
then_10:
  %107 = load i64**, i64*** %ptr_b
  %108 = bitcast i64** %107 to i64*
  %109 = getelementptr inbounds i64, i64* %108, i64 3
  %110 = bitcast i64* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = load i64**, i64*** %ptr_a
  %113 = bitcast i64** %112 to i64*
  %114 = getelementptr inbounds i64, i64* %113, i64 3
  %115 = bitcast i64* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = icmp sgt i64 %111, %116
  br i1 %117, label %then_12, label %end_if_13
then_12:
  %118 = load i64**, i64*** %ptr_b
  %119 = bitcast i64** %118 to i64*
  %120 = getelementptr inbounds i64, i64* %119, i64 3
  %121 = bitcast i64* %120 to i64*
  %122 = load i64, i64* %121, align 8
  store i64 %122, i64 %95
  br label %end_if_13
end_if_13:
  br label %end_if_11
end_if_11:
  %123 = load i64**, i64*** %ptr_b
  %124 = bitcast i64** %123 to i64*
  %125 = getelementptr inbounds i64, i64* %124, i64 2
  %126 = bitcast i64* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = load i64**, i64*** %ptr_a
  %129 = bitcast i64** %128 to i64*
  %130 = getelementptr inbounds i64, i64* %129, i64 2
  %131 = bitcast i64* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = icmp sgt i64 %127, %132
  br i1 %133, label %then_14, label %end_if_15
then_14:
  %134 = load i64**, i64*** %ptr_b
  %135 = bitcast i64** %134 to i64*
  %136 = getelementptr inbounds i64, i64* %135, i64 3
  %137 = bitcast i64* %136 to i64*
  %138 = load i64, i64* %137, align 8
  store i64 %138, i64 %95
  br label %end_if_15
end_if_15:
  %139 = call i64** @alloc_span(i64 %5, i64 %26, i64 %74, i64 %95)
  ret i64** %139
unreachable_16:
  ret i64** null
}

define i64** @alloc_diagnostic_error(i64** noalias %param_span, i8* noalias %param_message) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_message, i8** %ptr_message
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_err
  %3 = load i64**, i64*** %ptr_err
  %4 = load i64**, i64*** %ptr_span
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64***
  store i64** %4, i64*** %7, align 8
  %8 = load i64**, i64*** %ptr_err
  %9 = load i8*, i8** %ptr_message
  %10 = bitcast i64** %8 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 1
  %12 = bitcast i64* %11 to i8**
  store i8* %9, i8** %12, align 8
  %13 = load i64**, i64*** %ptr_err
  ret i64** %13
unreachable_0:
  ret i64** null
}

define void @print_diagnostic(i8* noalias %param_source, i64** noalias %param_span, i8* noalias %param_message) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i8* %param_source, i8** %ptr_source
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_message, i8** %ptr_message
  %1 = load i8*, i8** %ptr_message
  %2 = call i64 @puts(i8* %1)
  ret void
}

define i64** @alloc_parser(i64** noalias %param_lex) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_lex, i64*** %ptr_lex
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_p
  %3 = load i64**, i64*** %ptr_p
  %4 = load i64**, i64*** %ptr_lex
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64***
  store i64** %4, i64*** %7, align 8
  %8 = load i64**, i64*** %ptr_lex
  %9 = call i64** @next_token(i64** %8)
  %10 = load i64**, i64*** %ptr_lex
  %11 = call i64** @next_token(i64** %10)
  %12 = load i64**, i64*** %ptr_p
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 1
  %15 = bitcast i64* %14 to i64***
  store i64** %11, i64*** %15, align 8
  %16 = load i64**, i64*** %ptr_lex
  %17 = call i64** @next_token(i64** %16)
  %18 = load i64**, i64*** %ptr_lex
  %19 = call i64** @next_token(i64** %18)
  %20 = load i64**, i64*** %ptr_p
  %21 = bitcast i64** %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 2
  %23 = bitcast i64* %22 to i64***
  store i64** %19, i64*** %23, align 8
  %24 = load i64**, i64*** %ptr_p
  ret i64** %24
unreachable_0:
  ret i64** null
}

define void @advance_parser(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 2
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = load i64**, i64*** %ptr_p
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 1
  %9 = bitcast i64* %8 to i8**
  store i8* %5, i8** %9, align 8
  %10 = load i64**, i64*** %ptr_p
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 0
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = call i64** @next_token(i8* %14)
  %16 = load i64**, i64*** %ptr_p
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 0
  %19 = bitcast i64* %18 to i8**
  %20 = load i8*, i8** %19, align 8
  %21 = call i64** @next_token(i8* %20)
  %22 = load i64**, i64*** %ptr_p
  %23 = bitcast i64** %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 2
  %25 = bitcast i64* %24 to i64***
  store i64** %21, i64*** %25, align 8
  ret void
}

define void @report_error(i64** noalias %param_p, i64** noalias %param_span, i8* noalias %param_msg) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  store i64** %param_span, i64*** %ptr_span
  store i8* %param_msg, i8** %ptr_msg
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = load i64**, i64*** %ptr_span
  %11 = load i8*, i8** %ptr_msg
  call void @print_diagnostic(i8* %9, i64** %10, i8* %11)
  ret void
}

define i64** @new_empty_expr_list() {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_dummy
  %3 = load i64**, i64*** %ptr_dummy
  %4 = call i64** @new_list_Spanned_Expression(i64 2, i64** %3)
  ret i64** %4
unreachable_0:
  ret i64** null
}

define void @push_expr_list(i64** noalias %param_list, i64** noalias %param_expr) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64** %param_expr, i64*** %ptr_expr
  %1 = load i64**, i64*** %ptr_list
  %2 = load i64**, i64*** %ptr_expr
  call void @list_push_Spanned_Expression(i64** %1, i64** %2)
  ret void
}

define i1 @check_token(i64* noalias %param_kind, i8* noalias %target_str) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64* %param_kind, i64** %ptr_kind
  %1 = load i64*, i64** %ptr_kind
  %2 = getelementptr inbounds i64, i64* %1, i64 0
  %3 = bitcast i64* %2 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %when_case_1, label %when_next_2
when_case_1:
  %6 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.35, i64 0, i64 0))
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %then_3, label %end_if_4
then_3:
  ret i1 1
unreachable_5:
  br label %end_if_4
end_if_4:
  br label %when_end_0
when_next_2:
  %8 = icmp eq i64 %4, 1
  br i1 %8, label %when_case_6, label %when_next_7
when_case_6:
  %9 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i64 0, i64 0))
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %then_8, label %end_if_9
then_8:
  ret i1 1
unreachable_10:
  br label %end_if_9
end_if_9:
  br label %when_end_0
when_next_7:
  %11 = icmp eq i64 %4, 2
  br i1 %11, label %when_case_11, label %when_next_12
when_case_11:
  %12 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.37, i64 0, i64 0))
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %then_13, label %end_if_14
then_13:
  ret i1 1
unreachable_15:
  br label %end_if_14
end_if_14:
  br label %when_end_0
when_next_12:
  %14 = icmp eq i64 %4, 3
  br i1 %14, label %when_case_16, label %when_next_17
when_case_16:
  %15 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i64 0, i64 0))
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %then_18, label %end_if_19
then_18:
  ret i1 1
unreachable_20:
  br label %end_if_19
end_if_19:
  br label %when_end_0
when_next_17:
  %17 = icmp eq i64 %4, 4
  br i1 %17, label %when_case_21, label %when_next_22
when_case_21:
  %18 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.39, i64 0, i64 0))
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %then_23, label %end_if_24
then_23:
  ret i1 1
unreachable_25:
  br label %end_if_24
end_if_24:
  br label %when_end_0
when_next_22:
  %20 = icmp eq i64 %4, 5
  br i1 %20, label %when_case_26, label %when_next_27
when_case_26:
  %21 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.40, i64 0, i64 0))
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %then_28, label %end_if_29
then_28:
  ret i1 1
unreachable_30:
  br label %end_if_29
end_if_29:
  br label %when_end_0
when_next_27:
  %23 = icmp eq i64 %4, 6
  br i1 %23, label %when_case_31, label %when_next_32
when_case_31:
  %24 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.41, i64 0, i64 0))
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %then_33, label %end_if_34
then_33:
  ret i1 1
unreachable_35:
  br label %end_if_34
end_if_34:
  br label %when_end_0
when_next_32:
  %26 = icmp eq i64 %4, 7
  br i1 %26, label %when_case_36, label %when_next_37
when_case_36:
  %27 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.42, i64 0, i64 0))
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %then_38, label %end_if_39
then_38:
  ret i1 1
unreachable_40:
  br label %end_if_39
end_if_39:
  br label %when_end_0
when_next_37:
  %29 = icmp eq i64 %4, 8
  br i1 %29, label %when_case_41, label %when_next_42
when_case_41:
  %30 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.43, i64 0, i64 0))
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %then_43, label %end_if_44
then_43:
  ret i1 1
unreachable_45:
  br label %end_if_44
end_if_44:
  br label %when_end_0
when_next_42:
  %32 = icmp eq i64 %4, 9
  br i1 %32, label %when_case_46, label %when_next_47
when_case_46:
  %33 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.44, i64 0, i64 0))
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %then_48, label %end_if_49
then_48:
  ret i1 1
unreachable_50:
  br label %end_if_49
end_if_49:
  br label %when_end_0
when_next_47:
  %35 = icmp eq i64 %4, 10
  br i1 %35, label %when_case_51, label %when_next_52
when_case_51:
  %36 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.45, i64 0, i64 0))
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %then_53, label %end_if_54
then_53:
  ret i1 1
unreachable_55:
  br label %end_if_54
end_if_54:
  br label %when_end_0
when_next_52:
  %38 = icmp eq i64 %4, 11
  br i1 %38, label %when_case_56, label %when_next_57
when_case_56:
  %39 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.46, i64 0, i64 0))
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %then_58, label %end_if_59
then_58:
  ret i1 1
unreachable_60:
  br label %end_if_59
end_if_59:
  br label %when_end_0
when_next_57:
  %41 = icmp eq i64 %4, 12
  br i1 %41, label %when_case_61, label %when_next_62
when_case_61:
  %42 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.47, i64 0, i64 0))
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %then_63, label %end_if_64
then_63:
  ret i1 1
unreachable_65:
  br label %end_if_64
end_if_64:
  br label %when_end_0
when_next_62:
  %44 = icmp eq i64 %4, 13
  br i1 %44, label %when_case_66, label %when_next_67
when_case_66:
  %45 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.48, i64 0, i64 0))
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %then_68, label %end_if_69
then_68:
  ret i1 1
unreachable_70:
  br label %end_if_69
end_if_69:
  br label %when_end_0
when_next_67:
  %47 = icmp eq i64 %4, 14
  br i1 %47, label %when_case_71, label %when_next_72
when_case_71:
  %48 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.49, i64 0, i64 0))
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %then_73, label %end_if_74
then_73:
  ret i1 1
unreachable_75:
  br label %end_if_74
end_if_74:
  br label %when_end_0
when_next_72:
  %50 = icmp eq i64 %4, 15
  br i1 %50, label %when_case_76, label %when_next_77
when_case_76:
  %51 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.50, i64 0, i64 0))
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %then_78, label %end_if_79
then_78:
  ret i1 1
unreachable_80:
  br label %end_if_79
end_if_79:
  br label %when_end_0
when_next_77:
  %53 = icmp eq i64 %4, 16
  br i1 %53, label %when_case_81, label %when_next_82
when_case_81:
  %54 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.51, i64 0, i64 0))
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %then_83, label %end_if_84
then_83:
  ret i1 1
unreachable_85:
  br label %end_if_84
end_if_84:
  br label %when_end_0
when_next_82:
  %56 = icmp eq i64 %4, 17
  br i1 %56, label %when_case_86, label %when_next_87
when_case_86:
  %57 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i64 0, i64 0))
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %then_88, label %end_if_89
then_88:
  ret i1 1
unreachable_90:
  br label %end_if_89
end_if_89:
  br label %when_end_0
when_next_87:
  %59 = icmp eq i64 %4, 18
  br i1 %59, label %when_case_91, label %when_next_92
when_case_91:
  %60 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.53, i64 0, i64 0))
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %then_93, label %end_if_94
then_93:
  ret i1 1
unreachable_95:
  br label %end_if_94
end_if_94:
  br label %when_end_0
when_next_92:
  %62 = icmp eq i64 %4, 19
  br i1 %62, label %when_case_96, label %when_next_97
when_case_96:
  %63 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.54, i64 0, i64 0))
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %then_98, label %end_if_99
then_98:
  ret i1 1
unreachable_100:
  br label %end_if_99
end_if_99:
  br label %when_end_0
when_next_97:
  %65 = icmp eq i64 %4, 20
  br i1 %65, label %when_case_101, label %when_next_102
when_case_101:
  %66 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.55, i64 0, i64 0))
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %then_103, label %end_if_104
then_103:
  ret i1 1
unreachable_105:
  br label %end_if_104
end_if_104:
  br label %when_end_0
when_next_102:
  %68 = icmp eq i64 %4, 21
  br i1 %68, label %when_case_106, label %when_next_107
when_case_106:
  %69 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.56, i64 0, i64 0))
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %then_108, label %end_if_109
then_108:
  ret i1 1
unreachable_110:
  br label %end_if_109
end_if_109:
  br label %when_end_0
when_next_107:
  %71 = icmp eq i64 %4, 22
  br i1 %71, label %when_case_111, label %when_next_112
when_case_111:
  %72 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.57, i64 0, i64 0))
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %then_113, label %end_if_114
then_113:
  ret i1 1
unreachable_115:
  br label %end_if_114
end_if_114:
  br label %when_end_0
when_next_112:
  %74 = icmp eq i64 %4, 23
  br i1 %74, label %when_case_116, label %when_next_117
when_case_116:
  %75 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.58, i64 0, i64 0))
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %then_118, label %end_if_119
then_118:
  ret i1 1
unreachable_120:
  br label %end_if_119
end_if_119:
  br label %when_end_0
when_next_117:
  %77 = icmp eq i64 %4, 24
  br i1 %77, label %when_case_121, label %when_next_122
when_case_121:
  %78 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.59, i64 0, i64 0))
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %then_123, label %end_if_124
then_123:
  ret i1 1
unreachable_125:
  br label %end_if_124
end_if_124:
  br label %when_end_0
when_next_122:
  %80 = icmp eq i64 %4, 25
  br i1 %80, label %when_case_126, label %when_next_127
when_case_126:
  %81 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.60, i64 0, i64 0))
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %then_128, label %end_if_129
then_128:
  ret i1 1
unreachable_130:
  br label %end_if_129
end_if_129:
  br label %when_end_0
when_next_127:
  %83 = icmp eq i64 %4, 26
  br i1 %83, label %when_case_131, label %when_next_132
when_case_131:
  %84 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.61, i64 0, i64 0))
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %then_133, label %end_if_134
then_133:
  ret i1 1
unreachable_135:
  br label %end_if_134
end_if_134:
  br label %when_end_0
when_next_132:
  %86 = icmp eq i64 %4, 27
  br i1 %86, label %when_case_136, label %when_next_137
when_case_136:
  %87 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i64 0, i64 0))
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %then_138, label %end_if_139
then_138:
  ret i1 1
unreachable_140:
  br label %end_if_139
end_if_139:
  br label %when_end_0
when_next_137:
  %89 = icmp eq i64 %4, 28
  br i1 %89, label %when_case_141, label %when_next_142
when_case_141:
  %90 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.63, i64 0, i64 0))
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %then_143, label %end_if_144
then_143:
  ret i1 1
unreachable_145:
  br label %end_if_144
end_if_144:
  br label %when_end_0
when_next_142:
  %92 = icmp eq i64 %4, 29
  br i1 %92, label %when_case_146, label %when_next_147
when_case_146:
  %93 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.64, i64 0, i64 0))
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %then_148, label %end_if_149
then_148:
  ret i1 1
unreachable_150:
  br label %end_if_149
end_if_149:
  br label %when_end_0
when_next_147:
  %95 = icmp eq i64 %4, 30
  br i1 %95, label %when_case_151, label %when_next_152
when_case_151:
  %96 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.65, i64 0, i64 0))
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %then_153, label %end_if_154
then_153:
  ret i1 1
unreachable_155:
  br label %end_if_154
end_if_154:
  br label %when_end_0
when_next_152:
  %98 = icmp eq i64 %4, 31
  br i1 %98, label %when_case_156, label %when_next_157
when_case_156:
  %99 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.66, i64 0, i64 0))
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %then_158, label %end_if_159
then_158:
  ret i1 1
unreachable_160:
  br label %end_if_159
end_if_159:
  br label %when_end_0
when_next_157:
  %101 = icmp eq i64 %4, 32
  br i1 %101, label %when_case_161, label %when_next_162
when_case_161:
  %102 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.67, i64 0, i64 0))
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %then_163, label %end_if_164
then_163:
  ret i1 1
unreachable_165:
  br label %end_if_164
end_if_164:
  br label %when_end_0
when_next_162:
  %104 = icmp eq i64 %4, 33
  br i1 %104, label %when_case_166, label %when_next_167
when_case_166:
  %105 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.68, i64 0, i64 0))
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %then_168, label %end_if_169
then_168:
  ret i1 1
unreachable_170:
  br label %end_if_169
end_if_169:
  br label %when_end_0
when_next_167:
  %107 = icmp eq i64 %4, 34
  br i1 %107, label %when_case_171, label %when_next_172
when_case_171:
  %108 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.69, i64 0, i64 0))
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %then_173, label %end_if_174
then_173:
  ret i1 1
unreachable_175:
  br label %end_if_174
end_if_174:
  br label %when_end_0
when_next_172:
  %110 = icmp eq i64 %4, 35
  br i1 %110, label %when_case_176, label %when_next_177
when_case_176:
  %111 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.70, i64 0, i64 0))
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %then_178, label %end_if_179
then_178:
  ret i1 1
unreachable_180:
  br label %end_if_179
end_if_179:
  br label %when_end_0
when_next_177:
  %113 = icmp eq i64 %4, 36
  br i1 %113, label %when_case_181, label %when_next_182
when_case_181:
  %114 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.71, i64 0, i64 0))
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %then_183, label %end_if_184
then_183:
  ret i1 1
unreachable_185:
  br label %end_if_184
end_if_184:
  br label %when_end_0
when_next_182:
  %116 = icmp eq i64 %4, 37
  br i1 %116, label %when_case_186, label %when_next_187
when_case_186:
  %117 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.72, i64 0, i64 0))
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %then_188, label %end_if_189
then_188:
  ret i1 1
unreachable_190:
  br label %end_if_189
end_if_189:
  br label %when_end_0
when_next_187:
  %119 = icmp eq i64 %4, 38
  br i1 %119, label %when_case_191, label %when_next_192
when_case_191:
  %120 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.73, i64 0, i64 0))
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %then_193, label %end_if_194
then_193:
  ret i1 1
unreachable_195:
  br label %end_if_194
end_if_194:
  br label %when_end_0
when_next_192:
  %122 = icmp eq i64 %4, 39
  br i1 %122, label %when_case_196, label %when_next_197
when_case_196:
  %123 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.74, i64 0, i64 0))
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %then_198, label %end_if_199
then_198:
  ret i1 1
unreachable_200:
  br label %end_if_199
end_if_199:
  br label %when_end_0
when_next_197:
  %125 = icmp eq i64 %4, 40
  br i1 %125, label %when_case_201, label %when_next_202
when_case_201:
  %126 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.75, i64 0, i64 0))
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %then_203, label %end_if_204
then_203:
  ret i1 1
unreachable_205:
  br label %end_if_204
end_if_204:
  br label %when_end_0
when_next_202:
  %128 = icmp eq i64 %4, 41
  br i1 %128, label %when_case_206, label %when_next_207
when_case_206:
  %129 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.76, i64 0, i64 0))
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %then_208, label %end_if_209
then_208:
  ret i1 1
unreachable_210:
  br label %end_if_209
end_if_209:
  br label %when_end_0
when_next_207:
  %131 = icmp eq i64 %4, 42
  br i1 %131, label %when_case_211, label %when_next_212
when_case_211:
  %132 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.77, i64 0, i64 0))
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %then_213, label %end_if_214
then_213:
  ret i1 1
unreachable_215:
  br label %end_if_214
end_if_214:
  br label %when_end_0
when_next_212:
  %134 = icmp eq i64 %4, 43
  br i1 %134, label %when_case_216, label %when_next_217
when_case_216:
  %135 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.78, i64 0, i64 0))
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %then_218, label %end_if_219
then_218:
  ret i1 1
unreachable_220:
  br label %end_if_219
end_if_219:
  br label %when_end_0
when_next_217:
  %137 = icmp eq i64 %4, 44
  br i1 %137, label %when_case_221, label %when_next_222
when_case_221:
  %138 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.79, i64 0, i64 0))
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %then_223, label %end_if_224
then_223:
  ret i1 1
unreachable_225:
  br label %end_if_224
end_if_224:
  br label %when_end_0
when_next_222:
  %140 = icmp eq i64 %4, 45
  br i1 %140, label %when_case_226, label %when_next_227
when_case_226:
  %141 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.80, i64 0, i64 0))
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %then_228, label %end_if_229
then_228:
  ret i1 1
unreachable_230:
  br label %end_if_229
end_if_229:
  br label %when_end_0
when_next_227:
  %143 = icmp eq i64 %4, 46
  br i1 %143, label %when_case_231, label %when_next_232
when_case_231:
  %144 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.81, i64 0, i64 0))
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %then_233, label %end_if_234
then_233:
  ret i1 1
unreachable_235:
  br label %end_if_234
end_if_234:
  br label %when_end_0
when_next_232:
  %146 = icmp eq i64 %4, 47
  br i1 %146, label %when_case_236, label %when_next_237
when_case_236:
  %147 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.82, i64 0, i64 0))
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %then_238, label %end_if_239
then_238:
  ret i1 1
unreachable_240:
  br label %end_if_239
end_if_239:
  br label %when_end_0
when_next_237:
  %149 = icmp eq i64 %4, 48
  br i1 %149, label %when_case_241, label %when_next_242
when_case_241:
  %150 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.83, i64 0, i64 0))
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %then_243, label %end_if_244
then_243:
  ret i1 1
unreachable_245:
  br label %end_if_244
end_if_244:
  br label %when_end_0
when_next_242:
  %152 = icmp eq i64 %4, 49
  br i1 %152, label %when_case_246, label %when_next_247
when_case_246:
  %153 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.84, i64 0, i64 0))
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %then_248, label %end_if_249
then_248:
  ret i1 1
unreachable_250:
  br label %end_if_249
end_if_249:
  br label %when_end_0
when_next_247:
  %155 = icmp eq i64 %4, 50
  br i1 %155, label %when_case_251, label %when_next_252
when_case_251:
  %156 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.85, i64 0, i64 0))
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %then_253, label %end_if_254
then_253:
  ret i1 1
unreachable_255:
  br label %end_if_254
end_if_254:
  br label %when_end_0
when_next_252:
  %158 = icmp eq i64 %4, 51
  br i1 %158, label %when_case_256, label %when_next_257
when_case_256:
  %159 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.86, i64 0, i64 0))
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %then_258, label %end_if_259
then_258:
  ret i1 1
unreachable_260:
  br label %end_if_259
end_if_259:
  br label %when_end_0
when_next_257:
  %161 = icmp eq i64 %4, 52
  br i1 %161, label %when_case_261, label %when_next_262
when_case_261:
  %162 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.87, i64 0, i64 0))
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %then_263, label %end_if_264
then_263:
  ret i1 1
unreachable_265:
  br label %end_if_264
end_if_264:
  br label %when_end_0
when_next_262:
  %164 = icmp eq i64 %4, 53
  br i1 %164, label %when_case_266, label %when_next_267
when_case_266:
  %165 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.88, i64 0, i64 0))
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %then_268, label %end_if_269
then_268:
  ret i1 1
unreachable_270:
  br label %end_if_269
end_if_269:
  br label %when_end_0
when_next_267:
  %167 = icmp eq i64 %4, 54
  br i1 %167, label %when_case_271, label %when_next_272
when_case_271:
  %168 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.89, i64 0, i64 0))
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %then_273, label %end_if_274
then_273:
  ret i1 1
unreachable_275:
  br label %end_if_274
end_if_274:
  br label %when_end_0
when_next_272:
  %170 = icmp eq i64 %4, 55
  br i1 %170, label %when_case_276, label %when_next_277
when_case_276:
  %171 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.90, i64 0, i64 0))
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %then_278, label %end_if_279
then_278:
  ret i1 1
unreachable_280:
  br label %end_if_279
end_if_279:
  br label %when_end_0
when_next_277:
  %173 = icmp eq i64 %4, 56
  br i1 %173, label %when_case_281, label %when_next_282
when_case_281:
  %174 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.91, i64 0, i64 0))
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %then_283, label %end_if_284
then_283:
  ret i1 1
unreachable_285:
  br label %end_if_284
end_if_284:
  br label %when_end_0
when_next_282:
  %176 = icmp eq i64 %4, 57
  br i1 %176, label %when_case_286, label %when_next_287
when_case_286:
  %177 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.92, i64 0, i64 0))
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %then_288, label %end_if_289
then_288:
  ret i1 1
unreachable_290:
  br label %end_if_289
end_if_289:
  br label %when_end_0
when_next_287:
  %179 = icmp eq i64 %4, 58
  br i1 %179, label %when_case_291, label %when_next_292
when_case_291:
  %180 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.93, i64 0, i64 0))
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %then_293, label %end_if_294
then_293:
  ret i1 1
unreachable_295:
  br label %end_if_294
end_if_294:
  br label %when_end_0
when_next_292:
  %182 = icmp eq i64 %4, 59
  br i1 %182, label %when_case_296, label %when_next_297
when_case_296:
  %183 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.94, i64 0, i64 0))
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %then_298, label %end_if_299
then_298:
  ret i1 1
unreachable_300:
  br label %end_if_299
end_if_299:
  br label %when_end_0
when_next_297:
  %185 = icmp eq i64 %4, 60
  br i1 %185, label %when_case_301, label %when_next_302
when_case_301:
  %186 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.95, i64 0, i64 0))
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %then_303, label %end_if_304
then_303:
  ret i1 1
unreachable_305:
  br label %end_if_304
end_if_304:
  br label %when_end_0
when_next_302:
  %188 = icmp eq i64 %4, 61
  br i1 %188, label %when_case_306, label %when_next_307
when_case_306:
  %189 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.96, i64 0, i64 0))
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %then_308, label %end_if_309
then_308:
  ret i1 1
unreachable_310:
  br label %end_if_309
end_if_309:
  br label %when_end_0
when_next_307:
  %191 = icmp eq i64 %4, 62
  br i1 %191, label %when_case_311, label %when_next_312
when_case_311:
  %192 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.97, i64 0, i64 0))
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %then_313, label %end_if_314
then_313:
  ret i1 1
unreachable_315:
  br label %end_if_314
end_if_314:
  br label %when_end_0
when_next_312:
  %194 = icmp eq i64 %4, 63
  br i1 %194, label %when_case_316, label %when_next_317
when_case_316:
  %195 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.98, i64 0, i64 0))
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %then_318, label %end_if_319
then_318:
  ret i1 1
unreachable_320:
  br label %end_if_319
end_if_319:
  br label %when_end_0
when_next_317:
  %197 = icmp eq i64 %4, 64
  br i1 %197, label %when_case_321, label %when_next_322
when_case_321:
  %198 = call i32 @strcmp(i8* %target_str, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.99, i64 0, i64 0))
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %then_323, label %end_if_324
then_323:
  ret i1 1
unreachable_325:
  br label %end_if_324
end_if_324:
  br label %when_end_0
when_next_322:
  br label %when_end_0
when_end_0:
  ret i1 0
unreachable_326:
  ret i1 0
}

define i1 @consume(i64** noalias %param_p, i8* noalias %expected_str, i8* noalias %param_msg) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  store i8* %param_msg, i8** %ptr_msg
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = call i1 @check_token(i8* %9, i8* %expected_str)
  br i1 %10, label %then_0, label %end_if_1
then_0:
  %11 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %11)
  ret i1 1
unreachable_2:
  br label %end_if_1
end_if_1:
  %12 = load i64**, i64*** %ptr_p
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 1
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8
  %17 = bitcast i8* %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 1
  %19 = bitcast i64* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = load i64**, i64*** %ptr_p
  %22 = bitcast i64** %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 1
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = bitcast i8* %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 2
  %28 = bitcast i64* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = load i64**, i64*** %ptr_p
  %31 = bitcast i64** %30 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 1
  %33 = bitcast i64* %32 to i8**
  %34 = load i8*, i8** %33, align 8
  %35 = bitcast i8* %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 1
  %37 = bitcast i64* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = load i64**, i64*** %ptr_p
  %40 = bitcast i64** %39 to i64*
  %41 = getelementptr inbounds i64, i64* %40, i64 1
  %42 = bitcast i64* %41 to i8**
  %43 = load i8*, i8** %42, align 8
  %44 = bitcast i8* %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 2
  %46 = bitcast i64* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = call i64** @alloc_span(i64 %20, i64 %29, i64 %38, i64 %47)
  store i64** %48, i64*** %ptr_span
  %49 = load i64**, i64*** %ptr_p
  %50 = load i64**, i64*** %ptr_span
  %51 = load i8*, i8** %ptr_msg
  call void @report_error(i64** %49, i64** %50, i8* %51)
  ret i1 0
unreachable_3:
  ret i1 0
}

define i8* @consume_ident(i64** noalias %param_p, i8* noalias %param_msg) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  store i8* %param_msg, i8** %ptr_msg
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.100, i64 0, i64 0), i8** %ptr_ident
  store i1 0, i1* %ptr_matched
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds i64, i8* %9, i64 0
  %11 = bitcast i64* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %when_case_1, label %when_next_2
when_case_1:
  br label %when_end_0
when_next_2:
  %14 = icmp eq i64 %12, 1
  br i1 %14, label %when_case_3, label %when_next_4
when_case_3:
  br label %when_end_0
when_next_4:
  %15 = icmp eq i64 %12, 2
  br i1 %15, label %when_case_5, label %when_next_6
when_case_5:
  br label %when_end_0
when_next_6:
  %16 = icmp eq i64 %12, 3
  br i1 %16, label %when_case_7, label %when_next_8
when_case_7:
  br label %when_end_0
when_next_8:
  %17 = icmp eq i64 %12, 4
  br i1 %17, label %when_case_9, label %when_next_10
when_case_9:
  br label %when_end_0
when_next_10:
  %18 = icmp eq i64 %12, 5
  br i1 %18, label %when_case_11, label %when_next_12
when_case_11:
  br label %when_end_0
when_next_12:
  %19 = icmp eq i64 %12, 6
  br i1 %19, label %when_case_13, label %when_next_14
when_case_13:
  br label %when_end_0
when_next_14:
  %20 = icmp eq i64 %12, 7
  br i1 %20, label %when_case_15, label %when_next_16
when_case_15:
  br label %when_end_0
when_next_16:
  %21 = icmp eq i64 %12, 8
  br i1 %21, label %when_case_17, label %when_next_18
when_case_17:
  br label %when_end_0
when_next_18:
  %22 = icmp eq i64 %12, 9
  br i1 %22, label %when_case_19, label %when_next_20
when_case_19:
  br label %when_end_0
when_next_20:
  %23 = icmp eq i64 %12, 10
  br i1 %23, label %when_case_21, label %when_next_22
when_case_21:
  br label %when_end_0
when_next_22:
  %24 = icmp eq i64 %12, 11
  br i1 %24, label %when_case_23, label %when_next_24
when_case_23:
  br label %when_end_0
when_next_24:
  %25 = icmp eq i64 %12, 12
  br i1 %25, label %when_case_25, label %when_next_26
when_case_25:
  br label %when_end_0
when_next_26:
  %26 = icmp eq i64 %12, 13
  br i1 %26, label %when_case_27, label %when_next_28
when_case_27:
  br label %when_end_0
when_next_28:
  %27 = icmp eq i64 %12, 14
  br i1 %27, label %when_case_29, label %when_next_30
when_case_29:
  br label %when_end_0
when_next_30:
  %28 = icmp eq i64 %12, 15
  br i1 %28, label %when_case_31, label %when_next_32
when_case_31:
  br label %when_end_0
when_next_32:
  %29 = icmp eq i64 %12, 16
  br i1 %29, label %when_case_33, label %when_next_34
when_case_33:
  br label %when_end_0
when_next_34:
  %30 = icmp eq i64 %12, 17
  br i1 %30, label %when_case_35, label %when_next_36
when_case_35:
  br label %when_end_0
when_next_36:
  %31 = icmp eq i64 %12, 18
  br i1 %31, label %when_case_37, label %when_next_38
when_case_37:
  br label %when_end_0
when_next_38:
  %32 = icmp eq i64 %12, 19
  br i1 %32, label %when_case_39, label %when_next_40
when_case_39:
  br label %when_end_0
when_next_40:
  %33 = icmp eq i64 %12, 20
  br i1 %33, label %when_case_41, label %when_next_42
when_case_41:
  br label %when_end_0
when_next_42:
  %34 = icmp eq i64 %12, 21
  br i1 %34, label %when_case_43, label %when_next_44
when_case_43:
  br label %when_end_0
when_next_44:
  %35 = icmp eq i64 %12, 22
  br i1 %35, label %when_case_45, label %when_next_46
when_case_45:
  br label %when_end_0
when_next_46:
  %36 = icmp eq i64 %12, 23
  br i1 %36, label %when_case_47, label %when_next_48
when_case_47:
  br label %when_end_0
when_next_48:
  %37 = icmp eq i64 %12, 24
  br i1 %37, label %when_case_49, label %when_next_50
when_case_49:
  br label %when_end_0
when_next_50:
  %38 = icmp eq i64 %12, 25
  br i1 %38, label %when_case_51, label %when_next_52
when_case_51:
  %39 = getelementptr inbounds i64, i8* %9, i64 1
  %40 = bitcast i64* %39 to i8**
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %ptr_ident
  store i1 1, i1* %ptr_matched
  br label %when_end_0
when_next_52:
  %42 = icmp eq i64 %12, 26
  br i1 %42, label %when_case_53, label %when_next_54
when_case_53:
  br label %when_end_0
when_next_54:
  %43 = icmp eq i64 %12, 27
  br i1 %43, label %when_case_55, label %when_next_56
when_case_55:
  br label %when_end_0
when_next_56:
  %44 = icmp eq i64 %12, 28
  br i1 %44, label %when_case_57, label %when_next_58
when_case_57:
  br label %when_end_0
when_next_58:
  %45 = icmp eq i64 %12, 29
  br i1 %45, label %when_case_59, label %when_next_60
when_case_59:
  br label %when_end_0
when_next_60:
  %46 = icmp eq i64 %12, 30
  br i1 %46, label %when_case_61, label %when_next_62
when_case_61:
  br label %when_end_0
when_next_62:
  %47 = icmp eq i64 %12, 31
  br i1 %47, label %when_case_63, label %when_next_64
when_case_63:
  br label %when_end_0
when_next_64:
  %48 = icmp eq i64 %12, 32
  br i1 %48, label %when_case_65, label %when_next_66
when_case_65:
  br label %when_end_0
when_next_66:
  %49 = icmp eq i64 %12, 33
  br i1 %49, label %when_case_67, label %when_next_68
when_case_67:
  br label %when_end_0
when_next_68:
  %50 = icmp eq i64 %12, 34
  br i1 %50, label %when_case_69, label %when_next_70
when_case_69:
  br label %when_end_0
when_next_70:
  %51 = icmp eq i64 %12, 35
  br i1 %51, label %when_case_71, label %when_next_72
when_case_71:
  br label %when_end_0
when_next_72:
  %52 = icmp eq i64 %12, 36
  br i1 %52, label %when_case_73, label %when_next_74
when_case_73:
  br label %when_end_0
when_next_74:
  %53 = icmp eq i64 %12, 37
  br i1 %53, label %when_case_75, label %when_next_76
when_case_75:
  br label %when_end_0
when_next_76:
  %54 = icmp eq i64 %12, 38
  br i1 %54, label %when_case_77, label %when_next_78
when_case_77:
  br label %when_end_0
when_next_78:
  %55 = icmp eq i64 %12, 39
  br i1 %55, label %when_case_79, label %when_next_80
when_case_79:
  br label %when_end_0
when_next_80:
  %56 = icmp eq i64 %12, 40
  br i1 %56, label %when_case_81, label %when_next_82
when_case_81:
  br label %when_end_0
when_next_82:
  %57 = icmp eq i64 %12, 41
  br i1 %57, label %when_case_83, label %when_next_84
when_case_83:
  br label %when_end_0
when_next_84:
  %58 = icmp eq i64 %12, 42
  br i1 %58, label %when_case_85, label %when_next_86
when_case_85:
  br label %when_end_0
when_next_86:
  %59 = icmp eq i64 %12, 43
  br i1 %59, label %when_case_87, label %when_next_88
when_case_87:
  br label %when_end_0
when_next_88:
  %60 = icmp eq i64 %12, 44
  br i1 %60, label %when_case_89, label %when_next_90
when_case_89:
  br label %when_end_0
when_next_90:
  %61 = icmp eq i64 %12, 45
  br i1 %61, label %when_case_91, label %when_next_92
when_case_91:
  br label %when_end_0
when_next_92:
  %62 = icmp eq i64 %12, 46
  br i1 %62, label %when_case_93, label %when_next_94
when_case_93:
  br label %when_end_0
when_next_94:
  %63 = icmp eq i64 %12, 47
  br i1 %63, label %when_case_95, label %when_next_96
when_case_95:
  br label %when_end_0
when_next_96:
  %64 = icmp eq i64 %12, 48
  br i1 %64, label %when_case_97, label %when_next_98
when_case_97:
  br label %when_end_0
when_next_98:
  %65 = icmp eq i64 %12, 49
  br i1 %65, label %when_case_99, label %when_next_100
when_case_99:
  br label %when_end_0
when_next_100:
  %66 = icmp eq i64 %12, 50
  br i1 %66, label %when_case_101, label %when_next_102
when_case_101:
  br label %when_end_0
when_next_102:
  %67 = icmp eq i64 %12, 51
  br i1 %67, label %when_case_103, label %when_next_104
when_case_103:
  br label %when_end_0
when_next_104:
  %68 = icmp eq i64 %12, 52
  br i1 %68, label %when_case_105, label %when_next_106
when_case_105:
  br label %when_end_0
when_next_106:
  %69 = icmp eq i64 %12, 53
  br i1 %69, label %when_case_107, label %when_next_108
when_case_107:
  br label %when_end_0
when_next_108:
  %70 = icmp eq i64 %12, 54
  br i1 %70, label %when_case_109, label %when_next_110
when_case_109:
  br label %when_end_0
when_next_110:
  %71 = icmp eq i64 %12, 55
  br i1 %71, label %when_case_111, label %when_next_112
when_case_111:
  br label %when_end_0
when_next_112:
  %72 = icmp eq i64 %12, 56
  br i1 %72, label %when_case_113, label %when_next_114
when_case_113:
  br label %when_end_0
when_next_114:
  %73 = icmp eq i64 %12, 57
  br i1 %73, label %when_case_115, label %when_next_116
when_case_115:
  br label %when_end_0
when_next_116:
  %74 = icmp eq i64 %12, 58
  br i1 %74, label %when_case_117, label %when_next_118
when_case_117:
  br label %when_end_0
when_next_118:
  %75 = icmp eq i64 %12, 59
  br i1 %75, label %when_case_119, label %when_next_120
when_case_119:
  br label %when_end_0
when_next_120:
  %76 = icmp eq i64 %12, 60
  br i1 %76, label %when_case_121, label %when_next_122
when_case_121:
  br label %when_end_0
when_next_122:
  %77 = icmp eq i64 %12, 61
  br i1 %77, label %when_case_123, label %when_next_124
when_case_123:
  br label %when_end_0
when_next_124:
  %78 = icmp eq i64 %12, 62
  br i1 %78, label %when_case_125, label %when_next_126
when_case_125:
  br label %when_end_0
when_next_126:
  %79 = icmp eq i64 %12, 63
  br i1 %79, label %when_case_127, label %when_next_128
when_case_127:
  br label %when_end_0
when_next_128:
  %80 = icmp eq i64 %12, 64
  br i1 %80, label %when_case_129, label %when_next_130
when_case_129:
  br label %when_end_0
when_next_130:
  br label %when_end_0
when_end_0:
  %81 = load i1, i1* %ptr_matched
  br i1 %81, label %then_131, label %end_if_132
then_131:
  %82 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %82)
  %83 = load i8*, i8** %ptr_ident
  ret i8* %83
unreachable_133:
  br label %end_if_132
end_if_132:
  %84 = load i64**, i64*** %ptr_p
  %85 = bitcast i64** %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 1
  %87 = bitcast i64* %86 to i8**
  %88 = load i8*, i8** %87, align 8
  %89 = bitcast i8* %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = load i64**, i64*** %ptr_p
  %94 = bitcast i64** %93 to i64*
  %95 = getelementptr inbounds i64, i64* %94, i64 1
  %96 = bitcast i64* %95 to i8**
  %97 = load i8*, i8** %96, align 8
  %98 = bitcast i8* %97 to i64*
  %99 = getelementptr inbounds i64, i64* %98, i64 2
  %100 = bitcast i64* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = load i64**, i64*** %ptr_p
  %103 = bitcast i64** %102 to i64*
  %104 = getelementptr inbounds i64, i64* %103, i64 1
  %105 = bitcast i64* %104 to i8**
  %106 = load i8*, i8** %105, align 8
  %107 = bitcast i8* %106 to i64*
  %108 = getelementptr inbounds i64, i64* %107, i64 1
  %109 = bitcast i64* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = load i64**, i64*** %ptr_p
  %112 = bitcast i64** %111 to i64*
  %113 = getelementptr inbounds i64, i64* %112, i64 1
  %114 = bitcast i64* %113 to i8**
  %115 = load i8*, i8** %114, align 8
  %116 = bitcast i8* %115 to i64*
  %117 = getelementptr inbounds i64, i64* %116, i64 2
  %118 = bitcast i64* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = call i64** @alloc_span(i64 %92, i64 %101, i64 %110, i64 %119)
  store i64** %120, i64*** %ptr_span
  %121 = load i64**, i64*** %ptr_p
  %122 = load i64**, i64*** %ptr_span
  %123 = load i8*, i8** %ptr_msg
  call void @report_error(i64** %121, i64** %122, i8* %123)
  ret i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.101, i64 0, i64 0)
unreachable_134:
  ret i8* null
}

define i64** @parse_expression(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_pipe_expr(i64** %1)
  ret i64** %2
unreachable_0:
  ret i64** null
}

define i64** @parse_pipe_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_logical_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.102, i64 0, i64 0))
  br i1 %16, label %while_body_5, label %while_end_6
while_body_5:
  %17 = call i8* @malloc(i64 8)
  %18 = bitcast i8* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  store i64 46, i64* %19
  %20 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %20)
  %21 = load i64**, i64*** %ptr_p
  %22 = call i64** @parse_logical_expr(i64** %21)
  %23 = icmp eq i64** %22, null
  br i1 %23, label %when_none_8, label %when_val_9
when_none_8:
  store i8* null, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_7
when_val_9:
  store i64** %22, i64*** %ptr_right
  %24 = load i64**, i64*** %ptr_left
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  %31 = bitcast i64* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = load i64**, i64*** %ptr_left
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr inbounds i64, i64* %38, i64 1
  %40 = bitcast i64* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = load i64**, i64*** %ptr_right
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 1
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 2
  %49 = bitcast i64* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = load i64**, i64*** %ptr_right
  %52 = bitcast i64** %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 1
  %54 = bitcast i64* %53 to i8**
  %55 = load i8*, i8** %54, align 8
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 3
  %58 = bitcast i64* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = call i64** @alloc_span(i64 %32, i64 %41, i64 %50, i64 %59)
  store i64** %60, i64*** %ptr_span
  %61 = call i8* @malloc(i64 24)
  %62 = bitcast i8* %61 to i64*
  %63 = load i64**, i64*** %ptr_left
  %64 = bitcast i64* %62 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  %66 = bitcast i64* %65 to i64***
  store i64** %63, i64*** %66, align 8
  %67 = bitcast i64* %62 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i64**
  store i64* %18, i64** %69, align 8
  %70 = load i64**, i64*** %ptr_right
  %71 = bitcast i64* %62 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64***
  store i64** %70, i64*** %73, align 8
  %74 = call i8* @malloc(i64 16)
  %75 = bitcast i8* %74 to i64*
  store i64* %75, i64*** %ptr_expr
  %76 = load i64**, i64*** %ptr_expr
  %77 = load i64**, i64*** %ptr_span
  %78 = bitcast i64** %76 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 1
  %80 = bitcast i64* %79 to i64***
  store i64** %77, i64*** %80, align 8
  %81 = call i8* @malloc(i64 24)
  %82 = bitcast i8* %81 to i64*
  %83 = load i64, i64* %62
  store i64 %83, i64* %82
  %84 = call i8* @malloc(i64 16)
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 0
  store i64 1, i64* %86
  %87 = getelementptr inbounds i64, i64* %85, i64 1
  %88 = bitcast i64* %87 to i64**
  store i64* %82, i64** %88
  %89 = load i64**, i64*** %ptr_expr
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  %92 = bitcast i64* %91 to i64**
  store i64* %85, i64** %92, align 8
  %93 = load i64**, i64*** %ptr_expr
  store i64** %93, i64*** %ptr_left
  br label %when_end_7
when_end_7:
  br label %while_cond_4
while_end_6:
  %94 = load i64**, i64*** %ptr_left
  store i64** %94, i8* null
  ret i8* null
unreachable_11:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_logical_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_bitwise_or_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.103, i64 0, i64 0))
  %17 = load i64**, i64*** %ptr_p
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i1 @check_token(i8* %25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.104, i64 0, i64 0))
  %27 = or i1 %16, %26
  br i1 %27, label %while_body_5, label %while_end_6
while_body_5:
  %28 = call i8* @malloc(i64 8)
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  store i64 16, i64* %30
  %31 = load i64**, i64*** %ptr_p
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = call i1 @check_token(i8* %39, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.105, i64 0, i64 0))
  br i1 %40, label %then_7, label %end_if_8
then_7:
  %41 = call i8* @malloc(i64 8)
  %42 = bitcast i8* %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 0
  store i64 17, i64* %43
  store i64* %42, i64* %29
  br label %end_if_8
end_if_8:
  %44 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %44)
  %45 = load i64**, i64*** %ptr_p
  %46 = call i64** @parse_bitwise_or_expr(i64** %45)
  %47 = icmp eq i64** %46, null
  br i1 %47, label %when_none_10, label %when_val_11
when_none_10:
  store i8* null, i8* null
  ret i8* null
unreachable_12:
  br label %when_end_9
when_val_11:
  store i64** %46, i64*** %ptr_right
  %48 = load i64**, i64*** %ptr_left
  %49 = bitcast i64** %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 1
  %51 = bitcast i64* %50 to i8**
  %52 = load i8*, i8** %51, align 8
  %53 = bitcast i8* %52 to i64*
  %54 = getelementptr inbounds i64, i64* %53, i64 0
  %55 = bitcast i64* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = load i64**, i64*** %ptr_left
  %58 = bitcast i64** %57 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 1
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = bitcast i8* %61 to i64*
  %63 = getelementptr inbounds i64, i64* %62, i64 1
  %64 = bitcast i64* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = load i64**, i64*** %ptr_right
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = load i64**, i64*** %ptr_right
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i8**
  %79 = load i8*, i8** %78, align 8
  %80 = bitcast i8* %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 3
  %82 = bitcast i64* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = call i64** @alloc_span(i64 %56, i64 %65, i64 %74, i64 %83)
  store i64** %84, i64*** %ptr_span
  %85 = call i8* @malloc(i64 24)
  %86 = bitcast i8* %85 to i64*
  %87 = load i64**, i64*** %ptr_left
  %88 = bitcast i64* %86 to i64*
  %89 = getelementptr inbounds i64, i64* %88, i64 0
  %90 = bitcast i64* %89 to i64***
  store i64** %87, i64*** %90, align 8
  %91 = bitcast i64* %86 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 1
  %93 = bitcast i64* %92 to i64**
  store i64* %29, i64** %93, align 8
  %94 = load i64**, i64*** %ptr_right
  %95 = bitcast i64* %86 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 2
  %97 = bitcast i64* %96 to i64***
  store i64** %94, i64*** %97, align 8
  %98 = call i8* @malloc(i64 16)
  %99 = bitcast i8* %98 to i64*
  store i64* %99, i64*** %ptr_expr
  %100 = load i64**, i64*** %ptr_expr
  %101 = load i64**, i64*** %ptr_span
  %102 = bitcast i64** %100 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 1
  %104 = bitcast i64* %103 to i64***
  store i64** %101, i64*** %104, align 8
  %105 = call i8* @malloc(i64 24)
  %106 = bitcast i8* %105 to i64*
  %107 = load i64, i64* %86
  store i64 %107, i64* %106
  %108 = call i8* @malloc(i64 16)
  %109 = bitcast i8* %108 to i64*
  %110 = getelementptr inbounds i64, i64* %109, i64 0
  store i64 1, i64* %110
  %111 = getelementptr inbounds i64, i64* %109, i64 1
  %112 = bitcast i64* %111 to i64**
  store i64* %106, i64** %112
  %113 = load i64**, i64*** %ptr_expr
  %114 = bitcast i64** %113 to i64*
  %115 = getelementptr inbounds i64, i64* %114, i64 0
  %116 = bitcast i64* %115 to i64**
  store i64* %109, i64** %116, align 8
  %117 = load i64**, i64*** %ptr_expr
  store i64** %117, i64*** %ptr_left
  br label %when_end_9
when_end_9:
  br label %while_cond_4
while_end_6:
  %118 = load i64**, i64*** %ptr_left
  store i64** %118, i8* null
  ret i8* null
unreachable_13:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_bitwise_or_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_bitwise_xor_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.106, i64 0, i64 0))
  br i1 %16, label %while_body_5, label %while_end_6
while_body_5:
  %17 = call i8* @malloc(i64 8)
  %18 = bitcast i8* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  store i64 20, i64* %19
  %20 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %20)
  %21 = load i64**, i64*** %ptr_p
  %22 = call i64** @parse_bitwise_xor_expr(i64** %21)
  %23 = icmp eq i64** %22, null
  br i1 %23, label %when_none_8, label %when_val_9
when_none_8:
  store i8* null, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_7
when_val_9:
  store i64** %22, i64*** %ptr_right
  %24 = load i64**, i64*** %ptr_left
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  %31 = bitcast i64* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = load i64**, i64*** %ptr_left
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr inbounds i64, i64* %38, i64 1
  %40 = bitcast i64* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = load i64**, i64*** %ptr_right
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 1
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 2
  %49 = bitcast i64* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = load i64**, i64*** %ptr_right
  %52 = bitcast i64** %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 1
  %54 = bitcast i64* %53 to i8**
  %55 = load i8*, i8** %54, align 8
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 3
  %58 = bitcast i64* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = call i64** @alloc_span(i64 %32, i64 %41, i64 %50, i64 %59)
  store i64** %60, i64*** %ptr_span
  %61 = call i8* @malloc(i64 24)
  %62 = bitcast i8* %61 to i64*
  %63 = load i64**, i64*** %ptr_left
  %64 = bitcast i64* %62 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  %66 = bitcast i64* %65 to i64***
  store i64** %63, i64*** %66, align 8
  %67 = bitcast i64* %62 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i64**
  store i64* %18, i64** %69, align 8
  %70 = load i64**, i64*** %ptr_right
  %71 = bitcast i64* %62 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64***
  store i64** %70, i64*** %73, align 8
  %74 = call i8* @malloc(i64 16)
  %75 = bitcast i8* %74 to i64*
  store i64* %75, i64*** %ptr_expr
  %76 = load i64**, i64*** %ptr_expr
  %77 = load i64**, i64*** %ptr_span
  %78 = bitcast i64** %76 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 1
  %80 = bitcast i64* %79 to i64***
  store i64** %77, i64*** %80, align 8
  %81 = call i8* @malloc(i64 24)
  %82 = bitcast i8* %81 to i64*
  %83 = load i64, i64* %62
  store i64 %83, i64* %82
  %84 = call i8* @malloc(i64 16)
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 0
  store i64 1, i64* %86
  %87 = getelementptr inbounds i64, i64* %85, i64 1
  %88 = bitcast i64* %87 to i64**
  store i64* %82, i64** %88
  %89 = load i64**, i64*** %ptr_expr
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  %92 = bitcast i64* %91 to i64**
  store i64* %85, i64** %92, align 8
  %93 = load i64**, i64*** %ptr_expr
  store i64** %93, i64*** %ptr_left
  br label %when_end_7
when_end_7:
  br label %while_cond_4
while_end_6:
  %94 = load i64**, i64*** %ptr_left
  store i64** %94, i8* null
  ret i8* null
unreachable_11:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_bitwise_xor_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_bitwise_and_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.107, i64 0, i64 0))
  br i1 %16, label %while_body_5, label %while_end_6
while_body_5:
  %17 = call i8* @malloc(i64 8)
  %18 = bitcast i8* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  store i64 21, i64* %19
  %20 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %20)
  %21 = load i64**, i64*** %ptr_p
  %22 = call i64** @parse_bitwise_and_expr(i64** %21)
  %23 = icmp eq i64** %22, null
  br i1 %23, label %when_none_8, label %when_val_9
when_none_8:
  store i8* null, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_7
when_val_9:
  store i64** %22, i64*** %ptr_right
  %24 = load i64**, i64*** %ptr_left
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  %31 = bitcast i64* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = load i64**, i64*** %ptr_left
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr inbounds i64, i64* %38, i64 1
  %40 = bitcast i64* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = load i64**, i64*** %ptr_right
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 1
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 2
  %49 = bitcast i64* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = load i64**, i64*** %ptr_right
  %52 = bitcast i64** %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 1
  %54 = bitcast i64* %53 to i8**
  %55 = load i8*, i8** %54, align 8
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 3
  %58 = bitcast i64* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = call i64** @alloc_span(i64 %32, i64 %41, i64 %50, i64 %59)
  store i64** %60, i64*** %ptr_span
  %61 = call i8* @malloc(i64 24)
  %62 = bitcast i8* %61 to i64*
  %63 = load i64**, i64*** %ptr_left
  %64 = bitcast i64* %62 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  %66 = bitcast i64* %65 to i64***
  store i64** %63, i64*** %66, align 8
  %67 = bitcast i64* %62 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i64**
  store i64* %18, i64** %69, align 8
  %70 = load i64**, i64*** %ptr_right
  %71 = bitcast i64* %62 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64***
  store i64** %70, i64*** %73, align 8
  %74 = call i8* @malloc(i64 16)
  %75 = bitcast i8* %74 to i64*
  store i64* %75, i64*** %ptr_expr
  %76 = load i64**, i64*** %ptr_expr
  %77 = load i64**, i64*** %ptr_span
  %78 = bitcast i64** %76 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 1
  %80 = bitcast i64* %79 to i64***
  store i64** %77, i64*** %80, align 8
  %81 = call i8* @malloc(i64 24)
  %82 = bitcast i8* %81 to i64*
  %83 = load i64, i64* %62
  store i64 %83, i64* %82
  %84 = call i8* @malloc(i64 16)
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 0
  store i64 1, i64* %86
  %87 = getelementptr inbounds i64, i64* %85, i64 1
  %88 = bitcast i64* %87 to i64**
  store i64* %82, i64** %88
  %89 = load i64**, i64*** %ptr_expr
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  %92 = bitcast i64* %91 to i64**
  store i64* %85, i64** %92, align 8
  %93 = load i64**, i64*** %ptr_expr
  store i64** %93, i64*** %ptr_left
  br label %when_end_7
when_end_7:
  br label %while_cond_4
while_end_6:
  %94 = load i64**, i64*** %ptr_left
  store i64** %94, i8* null
  ret i8* null
unreachable_11:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_bitwise_and_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_equality_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.108, i64 0, i64 0))
  br i1 %16, label %while_body_5, label %while_end_6
while_body_5:
  %17 = call i8* @malloc(i64 8)
  %18 = bitcast i8* %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  store i64 19, i64* %19
  %20 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %20)
  %21 = load i64**, i64*** %ptr_p
  %22 = call i64** @parse_equality_expr(i64** %21)
  %23 = icmp eq i64** %22, null
  br i1 %23, label %when_none_8, label %when_val_9
when_none_8:
  store i8* null, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_7
when_val_9:
  store i64** %22, i64*** %ptr_right
  %24 = load i64**, i64*** %ptr_left
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  %31 = bitcast i64* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = load i64**, i64*** %ptr_left
  %34 = bitcast i64** %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 1
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr inbounds i64, i64* %38, i64 1
  %40 = bitcast i64* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = load i64**, i64*** %ptr_right
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 1
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 2
  %49 = bitcast i64* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = load i64**, i64*** %ptr_right
  %52 = bitcast i64** %51 to i64*
  %53 = getelementptr inbounds i64, i64* %52, i64 1
  %54 = bitcast i64* %53 to i8**
  %55 = load i8*, i8** %54, align 8
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 3
  %58 = bitcast i64* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = call i64** @alloc_span(i64 %32, i64 %41, i64 %50, i64 %59)
  store i64** %60, i64*** %ptr_span
  %61 = call i8* @malloc(i64 24)
  %62 = bitcast i8* %61 to i64*
  %63 = load i64**, i64*** %ptr_left
  %64 = bitcast i64* %62 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  %66 = bitcast i64* %65 to i64***
  store i64** %63, i64*** %66, align 8
  %67 = bitcast i64* %62 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i64**
  store i64* %18, i64** %69, align 8
  %70 = load i64**, i64*** %ptr_right
  %71 = bitcast i64* %62 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64***
  store i64** %70, i64*** %73, align 8
  %74 = call i8* @malloc(i64 16)
  %75 = bitcast i8* %74 to i64*
  store i64* %75, i64*** %ptr_expr
  %76 = load i64**, i64*** %ptr_expr
  %77 = load i64**, i64*** %ptr_span
  %78 = bitcast i64** %76 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 1
  %80 = bitcast i64* %79 to i64***
  store i64** %77, i64*** %80, align 8
  %81 = call i8* @malloc(i64 24)
  %82 = bitcast i8* %81 to i64*
  %83 = load i64, i64* %62
  store i64 %83, i64* %82
  %84 = call i8* @malloc(i64 16)
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 0
  store i64 1, i64* %86
  %87 = getelementptr inbounds i64, i64* %85, i64 1
  %88 = bitcast i64* %87 to i64**
  store i64* %82, i64** %88
  %89 = load i64**, i64*** %ptr_expr
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  %92 = bitcast i64* %91 to i64**
  store i64* %85, i64** %92, align 8
  %93 = load i64**, i64*** %ptr_expr
  store i64** %93, i64*** %ptr_left
  br label %when_end_7
when_end_7:
  br label %while_cond_4
while_end_6:
  %94 = load i64**, i64*** %ptr_left
  store i64** %94, i8* null
  ret i8* null
unreachable_11:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_equality_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_relational_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.109, i64 0, i64 0))
  %17 = load i64**, i64*** %ptr_p
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i1 @check_token(i8* %25, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.110, i64 0, i64 0))
  %27 = or i1 %16, %26
  br i1 %27, label %while_body_5, label %while_end_6
while_body_5:
  %28 = call i8* @malloc(i64 8)
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  store i64 35, i64* %30
  %31 = load i64**, i64*** %ptr_p
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = call i1 @check_token(i8* %39, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.111, i64 0, i64 0))
  br i1 %40, label %then_7, label %end_if_8
then_7:
  %41 = call i8* @malloc(i64 8)
  %42 = bitcast i8* %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 0
  store i64 36, i64* %43
  store i64* %42, i64* %29
  br label %end_if_8
end_if_8:
  %44 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %44)
  %45 = load i64**, i64*** %ptr_p
  %46 = call i64** @parse_relational_expr(i64** %45)
  %47 = icmp eq i64** %46, null
  br i1 %47, label %when_none_10, label %when_val_11
when_none_10:
  store i8* null, i8* null
  ret i8* null
unreachable_12:
  br label %when_end_9
when_val_11:
  store i64** %46, i64*** %ptr_right
  %48 = load i64**, i64*** %ptr_left
  %49 = bitcast i64** %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 1
  %51 = bitcast i64* %50 to i8**
  %52 = load i8*, i8** %51, align 8
  %53 = bitcast i8* %52 to i64*
  %54 = getelementptr inbounds i64, i64* %53, i64 0
  %55 = bitcast i64* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = load i64**, i64*** %ptr_left
  %58 = bitcast i64** %57 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 1
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = bitcast i8* %61 to i64*
  %63 = getelementptr inbounds i64, i64* %62, i64 1
  %64 = bitcast i64* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = load i64**, i64*** %ptr_right
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = load i64**, i64*** %ptr_right
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i8**
  %79 = load i8*, i8** %78, align 8
  %80 = bitcast i8* %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 3
  %82 = bitcast i64* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = call i64** @alloc_span(i64 %56, i64 %65, i64 %74, i64 %83)
  store i64** %84, i64*** %ptr_span
  %85 = call i8* @malloc(i64 24)
  %86 = bitcast i8* %85 to i64*
  %87 = load i64**, i64*** %ptr_left
  %88 = bitcast i64* %86 to i64*
  %89 = getelementptr inbounds i64, i64* %88, i64 0
  %90 = bitcast i64* %89 to i64***
  store i64** %87, i64*** %90, align 8
  %91 = bitcast i64* %86 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 1
  %93 = bitcast i64* %92 to i64**
  store i64* %29, i64** %93, align 8
  %94 = load i64**, i64*** %ptr_right
  %95 = bitcast i64* %86 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 2
  %97 = bitcast i64* %96 to i64***
  store i64** %94, i64*** %97, align 8
  %98 = call i8* @malloc(i64 16)
  %99 = bitcast i8* %98 to i64*
  store i64* %99, i64*** %ptr_expr
  %100 = load i64**, i64*** %ptr_expr
  %101 = load i64**, i64*** %ptr_span
  %102 = bitcast i64** %100 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 1
  %104 = bitcast i64* %103 to i64***
  store i64** %101, i64*** %104, align 8
  %105 = call i8* @malloc(i64 24)
  %106 = bitcast i8* %105 to i64*
  %107 = load i64, i64* %86
  store i64 %107, i64* %106
  %108 = call i8* @malloc(i64 16)
  %109 = bitcast i8* %108 to i64*
  %110 = getelementptr inbounds i64, i64* %109, i64 0
  store i64 1, i64* %110
  %111 = getelementptr inbounds i64, i64* %109, i64 1
  %112 = bitcast i64* %111 to i64**
  store i64* %106, i64** %112
  %113 = load i64**, i64*** %ptr_expr
  %114 = bitcast i64** %113 to i64*
  %115 = getelementptr inbounds i64, i64* %114, i64 0
  %116 = bitcast i64* %115 to i64**
  store i64* %109, i64** %116, align 8
  %117 = load i64**, i64*** %ptr_expr
  store i64** %117, i64*** %ptr_left
  br label %when_end_9
when_end_9:
  br label %while_cond_4
while_end_6:
  %118 = load i64**, i64*** %ptr_left
  store i64** %118, i8* null
  ret i8* null
unreachable_13:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_relational_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_shift_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.112, i64 0, i64 0))
  %17 = load i64**, i64*** %ptr_p
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i1 @check_token(i8* %25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.113, i64 0, i64 0))
  %27 = or i1 %16, %26
  %28 = load i64**, i64*** %ptr_p
  %29 = bitcast i64** %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 1
  %31 = bitcast i64* %30 to i8**
  %32 = load i8*, i8** %31, align 8
  %33 = bitcast i8* %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 0
  %35 = bitcast i64* %34 to i8**
  %36 = load i8*, i8** %35, align 8
  %37 = call i1 @check_token(i8* %36, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.114, i64 0, i64 0))
  %38 = or i1 %27, %37
  %39 = load i64**, i64*** %ptr_p
  %40 = bitcast i64** %39 to i64*
  %41 = getelementptr inbounds i64, i64* %40, i64 1
  %42 = bitcast i64* %41 to i8**
  %43 = load i8*, i8** %42, align 8
  %44 = bitcast i8* %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 0
  %46 = bitcast i64* %45 to i8**
  %47 = load i8*, i8** %46, align 8
  %48 = call i1 @check_token(i8* %47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.115, i64 0, i64 0))
  %49 = or i1 %38, %48
  br i1 %49, label %while_body_5, label %while_end_6
while_body_5:
  %50 = call i8* @malloc(i64 8)
  %51 = bitcast i8* %50 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 0
  store i64 37, i64* %52
  %53 = load i64**, i64*** %ptr_p
  %54 = bitcast i64** %53 to i64*
  %55 = getelementptr inbounds i64, i64* %54, i64 1
  %56 = bitcast i64* %55 to i8**
  %57 = load i8*, i8** %56, align 8
  %58 = bitcast i8* %57 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 0
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = call i1 @check_token(i8* %61, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.116, i64 0, i64 0))
  br i1 %62, label %then_7, label %end_if_8
then_7:
  %63 = call i8* @malloc(i64 8)
  %64 = bitcast i8* %63 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  store i64 38, i64* %65
  store i64* %64, i64* %51
  br label %end_if_8
end_if_8:
  %66 = load i64**, i64*** %ptr_p
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 0
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = call i1 @check_token(i8* %74, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.117, i64 0, i64 0))
  br i1 %75, label %then_9, label %end_if_10
then_9:
  %76 = call i8* @malloc(i64 8)
  %77 = bitcast i8* %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 0
  store i64 39, i64* %78
  store i64* %77, i64* %51
  br label %end_if_10
end_if_10:
  %79 = load i64**, i64*** %ptr_p
  %80 = bitcast i64** %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 1
  %82 = bitcast i64* %81 to i8**
  %83 = load i8*, i8** %82, align 8
  %84 = bitcast i8* %83 to i64*
  %85 = getelementptr inbounds i64, i64* %84, i64 0
  %86 = bitcast i64* %85 to i8**
  %87 = load i8*, i8** %86, align 8
  %88 = call i1 @check_token(i8* %87, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.118, i64 0, i64 0))
  br i1 %88, label %then_11, label %end_if_12
then_11:
  %89 = call i8* @malloc(i64 8)
  %90 = bitcast i8* %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 0
  store i64 40, i64* %91
  store i64* %90, i64* %51
  br label %end_if_12
end_if_12:
  %92 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %92)
  %93 = load i64**, i64*** %ptr_p
  %94 = call i64** @parse_shift_expr(i64** %93)
  %95 = icmp eq i64** %94, null
  br i1 %95, label %when_none_14, label %when_val_15
when_none_14:
  store i8* null, i8* null
  ret i8* null
unreachable_16:
  br label %when_end_13
when_val_15:
  store i64** %94, i64*** %ptr_right
  %96 = load i64**, i64*** %ptr_left
  %97 = bitcast i64** %96 to i64*
  %98 = getelementptr inbounds i64, i64* %97, i64 1
  %99 = bitcast i64* %98 to i8**
  %100 = load i8*, i8** %99, align 8
  %101 = bitcast i8* %100 to i64*
  %102 = getelementptr inbounds i64, i64* %101, i64 0
  %103 = bitcast i64* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = load i64**, i64*** %ptr_left
  %106 = bitcast i64** %105 to i64*
  %107 = getelementptr inbounds i64, i64* %106, i64 1
  %108 = bitcast i64* %107 to i8**
  %109 = load i8*, i8** %108, align 8
  %110 = bitcast i8* %109 to i64*
  %111 = getelementptr inbounds i64, i64* %110, i64 1
  %112 = bitcast i64* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = load i64**, i64*** %ptr_right
  %115 = bitcast i64** %114 to i64*
  %116 = getelementptr inbounds i64, i64* %115, i64 1
  %117 = bitcast i64* %116 to i8**
  %118 = load i8*, i8** %117, align 8
  %119 = bitcast i8* %118 to i64*
  %120 = getelementptr inbounds i64, i64* %119, i64 2
  %121 = bitcast i64* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = load i64**, i64*** %ptr_right
  %124 = bitcast i64** %123 to i64*
  %125 = getelementptr inbounds i64, i64* %124, i64 1
  %126 = bitcast i64* %125 to i8**
  %127 = load i8*, i8** %126, align 8
  %128 = bitcast i8* %127 to i64*
  %129 = getelementptr inbounds i64, i64* %128, i64 3
  %130 = bitcast i64* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = call i64** @alloc_span(i64 %104, i64 %113, i64 %122, i64 %131)
  store i64** %132, i64*** %ptr_span
  %133 = call i8* @malloc(i64 24)
  %134 = bitcast i8* %133 to i64*
  %135 = load i64**, i64*** %ptr_left
  %136 = bitcast i64* %134 to i64*
  %137 = getelementptr inbounds i64, i64* %136, i64 0
  %138 = bitcast i64* %137 to i64***
  store i64** %135, i64*** %138, align 8
  %139 = bitcast i64* %134 to i64*
  %140 = getelementptr inbounds i64, i64* %139, i64 1
  %141 = bitcast i64* %140 to i64**
  store i64* %51, i64** %141, align 8
  %142 = load i64**, i64*** %ptr_right
  %143 = bitcast i64* %134 to i64*
  %144 = getelementptr inbounds i64, i64* %143, i64 2
  %145 = bitcast i64* %144 to i64***
  store i64** %142, i64*** %145, align 8
  %146 = call i8* @malloc(i64 16)
  %147 = bitcast i8* %146 to i64*
  store i64* %147, i64*** %ptr_expr
  %148 = load i64**, i64*** %ptr_expr
  %149 = load i64**, i64*** %ptr_span
  %150 = bitcast i64** %148 to i64*
  %151 = getelementptr inbounds i64, i64* %150, i64 1
  %152 = bitcast i64* %151 to i64***
  store i64** %149, i64*** %152, align 8
  %153 = call i8* @malloc(i64 24)
  %154 = bitcast i8* %153 to i64*
  %155 = load i64, i64* %134
  store i64 %155, i64* %154
  %156 = call i8* @malloc(i64 16)
  %157 = bitcast i8* %156 to i64*
  %158 = getelementptr inbounds i64, i64* %157, i64 0
  store i64 1, i64* %158
  %159 = getelementptr inbounds i64, i64* %157, i64 1
  %160 = bitcast i64* %159 to i64**
  store i64* %154, i64** %160
  %161 = load i64**, i64*** %ptr_expr
  %162 = bitcast i64** %161 to i64*
  %163 = getelementptr inbounds i64, i64* %162, i64 0
  %164 = bitcast i64* %163 to i64**
  store i64* %157, i64** %164, align 8
  %165 = load i64**, i64*** %ptr_expr
  store i64** %165, i64*** %ptr_left
  br label %when_end_13
when_end_13:
  br label %while_cond_4
while_end_6:
  %166 = load i64**, i64*** %ptr_left
  store i64** %166, i8* null
  ret i8* null
unreachable_17:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_shift_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_additive_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.119, i64 0, i64 0))
  %17 = load i64**, i64*** %ptr_p
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i1 @check_token(i8* %25, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.120, i64 0, i64 0))
  %27 = or i1 %16, %26
  br i1 %27, label %while_body_5, label %while_end_6
while_body_5:
  %28 = call i8* @malloc(i64 8)
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  store i64 22, i64* %30
  %31 = load i64**, i64*** %ptr_p
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = call i1 @check_token(i8* %39, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.121, i64 0, i64 0))
  br i1 %40, label %then_7, label %end_if_8
then_7:
  %41 = call i8* @malloc(i64 8)
  %42 = bitcast i8* %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 0
  store i64 23, i64* %43
  store i64* %42, i64* %29
  br label %end_if_8
end_if_8:
  %44 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %44)
  %45 = load i64**, i64*** %ptr_p
  %46 = call i64** @parse_additive_expr(i64** %45)
  %47 = icmp eq i64** %46, null
  br i1 %47, label %when_none_10, label %when_val_11
when_none_10:
  store i8* null, i8* null
  ret i8* null
unreachable_12:
  br label %when_end_9
when_val_11:
  store i64** %46, i64*** %ptr_right
  %48 = load i64**, i64*** %ptr_left
  %49 = bitcast i64** %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 1
  %51 = bitcast i64* %50 to i8**
  %52 = load i8*, i8** %51, align 8
  %53 = bitcast i8* %52 to i64*
  %54 = getelementptr inbounds i64, i64* %53, i64 0
  %55 = bitcast i64* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = load i64**, i64*** %ptr_left
  %58 = bitcast i64** %57 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 1
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = bitcast i8* %61 to i64*
  %63 = getelementptr inbounds i64, i64* %62, i64 1
  %64 = bitcast i64* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = load i64**, i64*** %ptr_right
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = load i64**, i64*** %ptr_right
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i8**
  %79 = load i8*, i8** %78, align 8
  %80 = bitcast i8* %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 3
  %82 = bitcast i64* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = call i64** @alloc_span(i64 %56, i64 %65, i64 %74, i64 %83)
  store i64** %84, i64*** %ptr_span
  %85 = call i8* @malloc(i64 24)
  %86 = bitcast i8* %85 to i64*
  %87 = load i64**, i64*** %ptr_left
  %88 = bitcast i64* %86 to i64*
  %89 = getelementptr inbounds i64, i64* %88, i64 0
  %90 = bitcast i64* %89 to i64***
  store i64** %87, i64*** %90, align 8
  %91 = bitcast i64* %86 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 1
  %93 = bitcast i64* %92 to i64**
  store i64* %29, i64** %93, align 8
  %94 = load i64**, i64*** %ptr_right
  %95 = bitcast i64* %86 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 2
  %97 = bitcast i64* %96 to i64***
  store i64** %94, i64*** %97, align 8
  %98 = call i8* @malloc(i64 16)
  %99 = bitcast i8* %98 to i64*
  store i64* %99, i64*** %ptr_expr
  %100 = load i64**, i64*** %ptr_expr
  %101 = load i64**, i64*** %ptr_span
  %102 = bitcast i64** %100 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 1
  %104 = bitcast i64* %103 to i64***
  store i64** %101, i64*** %104, align 8
  %105 = call i8* @malloc(i64 24)
  %106 = bitcast i8* %105 to i64*
  %107 = load i64, i64* %86
  store i64 %107, i64* %106
  %108 = call i8* @malloc(i64 16)
  %109 = bitcast i8* %108 to i64*
  %110 = getelementptr inbounds i64, i64* %109, i64 0
  store i64 1, i64* %110
  %111 = getelementptr inbounds i64, i64* %109, i64 1
  %112 = bitcast i64* %111 to i64**
  store i64* %106, i64** %112
  %113 = load i64**, i64*** %ptr_expr
  %114 = bitcast i64** %113 to i64*
  %115 = getelementptr inbounds i64, i64* %114, i64 0
  %116 = bitcast i64* %115 to i64**
  store i64* %109, i64** %116, align 8
  %117 = load i64**, i64*** %ptr_expr
  store i64** %117, i64*** %ptr_left
  br label %when_end_9
when_end_9:
  br label %while_cond_4
while_end_6:
  %118 = load i64**, i64*** %ptr_left
  store i64** %118, i8* null
  ret i8* null
unreachable_13:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_additive_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_multiplicative_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.122, i64 0, i64 0))
  %17 = load i64**, i64*** %ptr_p
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i1 @check_token(i8* %25, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.123, i64 0, i64 0))
  %27 = or i1 %16, %26
  br i1 %27, label %while_body_5, label %while_end_6
while_body_5:
  %28 = call i8* @malloc(i64 8)
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  store i64 41, i64* %30
  %31 = load i64**, i64*** %ptr_p
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = call i1 @check_token(i8* %39, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.124, i64 0, i64 0))
  br i1 %40, label %then_7, label %end_if_8
then_7:
  %41 = call i8* @malloc(i64 8)
  %42 = bitcast i8* %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 0
  store i64 42, i64* %43
  store i64* %42, i64* %29
  br label %end_if_8
end_if_8:
  %44 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %44)
  %45 = load i64**, i64*** %ptr_p
  %46 = call i64** @parse_multiplicative_expr(i64** %45)
  %47 = icmp eq i64** %46, null
  br i1 %47, label %when_none_10, label %when_val_11
when_none_10:
  store i8* null, i8* null
  ret i8* null
unreachable_12:
  br label %when_end_9
when_val_11:
  store i64** %46, i64*** %ptr_right
  %48 = load i64**, i64*** %ptr_left
  %49 = bitcast i64** %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 1
  %51 = bitcast i64* %50 to i8**
  %52 = load i8*, i8** %51, align 8
  %53 = bitcast i8* %52 to i64*
  %54 = getelementptr inbounds i64, i64* %53, i64 0
  %55 = bitcast i64* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = load i64**, i64*** %ptr_left
  %58 = bitcast i64** %57 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 1
  %60 = bitcast i64* %59 to i8**
  %61 = load i8*, i8** %60, align 8
  %62 = bitcast i8* %61 to i64*
  %63 = getelementptr inbounds i64, i64* %62, i64 1
  %64 = bitcast i64* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = load i64**, i64*** %ptr_right
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = load i64**, i64*** %ptr_right
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i8**
  %79 = load i8*, i8** %78, align 8
  %80 = bitcast i8* %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 3
  %82 = bitcast i64* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = call i64** @alloc_span(i64 %56, i64 %65, i64 %74, i64 %83)
  store i64** %84, i64*** %ptr_span
  %85 = call i8* @malloc(i64 24)
  %86 = bitcast i8* %85 to i64*
  %87 = load i64**, i64*** %ptr_left
  %88 = bitcast i64* %86 to i64*
  %89 = getelementptr inbounds i64, i64* %88, i64 0
  %90 = bitcast i64* %89 to i64***
  store i64** %87, i64*** %90, align 8
  %91 = bitcast i64* %86 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 1
  %93 = bitcast i64* %92 to i64**
  store i64* %29, i64** %93, align 8
  %94 = load i64**, i64*** %ptr_right
  %95 = bitcast i64* %86 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 2
  %97 = bitcast i64* %96 to i64***
  store i64** %94, i64*** %97, align 8
  %98 = call i8* @malloc(i64 16)
  %99 = bitcast i8* %98 to i64*
  store i64* %99, i64*** %ptr_expr
  %100 = load i64**, i64*** %ptr_expr
  %101 = load i64**, i64*** %ptr_span
  %102 = bitcast i64** %100 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 1
  %104 = bitcast i64* %103 to i64***
  store i64** %101, i64*** %104, align 8
  %105 = call i8* @malloc(i64 24)
  %106 = bitcast i8* %105 to i64*
  %107 = load i64, i64* %86
  store i64 %107, i64* %106
  %108 = call i8* @malloc(i64 16)
  %109 = bitcast i8* %108 to i64*
  %110 = getelementptr inbounds i64, i64* %109, i64 0
  store i64 1, i64* %110
  %111 = getelementptr inbounds i64, i64* %109, i64 1
  %112 = bitcast i64* %111 to i64**
  store i64* %106, i64** %112
  %113 = load i64**, i64*** %ptr_expr
  %114 = bitcast i64** %113 to i64*
  %115 = getelementptr inbounds i64, i64* %114, i64 0
  %116 = bitcast i64* %115 to i64**
  store i64* %109, i64** %116, align 8
  %117 = load i64**, i64*** %ptr_expr
  store i64** %117, i64*** %ptr_left
  br label %when_end_9
when_end_9:
  br label %while_cond_4
while_end_6:
  %118 = load i64**, i64*** %ptr_left
  store i64** %118, i8* null
  ret i8* null
unreachable_13:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_multiplicative_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_unary_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.125, i64 0, i64 0))
  %17 = load i64**, i64*** %ptr_p
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i1 @check_token(i8* %25, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.126, i64 0, i64 0))
  %27 = or i1 %16, %26
  %28 = load i64**, i64*** %ptr_p
  %29 = bitcast i64** %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 1
  %31 = bitcast i64* %30 to i8**
  %32 = load i8*, i8** %31, align 8
  %33 = bitcast i8* %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 0
  %35 = bitcast i64* %34 to i8**
  %36 = load i8*, i8** %35, align 8
  %37 = call i1 @check_token(i8* %36, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.127, i64 0, i64 0))
  %38 = or i1 %27, %37
  br i1 %38, label %while_body_5, label %while_end_6
while_body_5:
  %39 = call i8* @malloc(i64 8)
  %40 = bitcast i8* %39 to i64*
  %41 = getelementptr inbounds i64, i64* %40, i64 0
  store i64 43, i64* %41
  %42 = load i64**, i64*** %ptr_p
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 1
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 0
  %49 = bitcast i64* %48 to i8**
  %50 = load i8*, i8** %49, align 8
  %51 = call i1 @check_token(i8* %50, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.128, i64 0, i64 0))
  br i1 %51, label %then_7, label %end_if_8
then_7:
  %52 = call i8* @malloc(i64 8)
  %53 = bitcast i8* %52 to i64*
  %54 = getelementptr inbounds i64, i64* %53, i64 0
  store i64 44, i64* %54
  store i64* %53, i64* %40
  br label %end_if_8
end_if_8:
  %55 = load i64**, i64*** %ptr_p
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 1
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  %62 = bitcast i64* %61 to i8**
  %63 = load i8*, i8** %62, align 8
  %64 = call i1 @check_token(i8* %63, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.129, i64 0, i64 0))
  br i1 %64, label %then_9, label %end_if_10
then_9:
  %65 = call i8* @malloc(i64 8)
  %66 = bitcast i8* %65 to i64*
  %67 = getelementptr inbounds i64, i64* %66, i64 0
  store i64 45, i64* %67
  store i64* %66, i64* %40
  br label %end_if_10
end_if_10:
  %68 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %68)
  %69 = load i64**, i64*** %ptr_p
  %70 = call i64** @parse_unary_expr(i64** %69)
  %71 = icmp eq i64** %70, null
  br i1 %71, label %when_none_12, label %when_val_13
when_none_12:
  store i8* null, i8* null
  ret i8* null
unreachable_14:
  br label %when_end_11
when_val_13:
  store i64** %70, i64*** %ptr_right
  %72 = load i64**, i64*** %ptr_left
  %73 = bitcast i64** %72 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 1
  %75 = bitcast i64* %74 to i8**
  %76 = load i8*, i8** %75, align 8
  %77 = bitcast i8* %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 0
  %79 = bitcast i64* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = load i64**, i64*** %ptr_left
  %82 = bitcast i64** %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = bitcast i64* %83 to i8**
  %85 = load i8*, i8** %84, align 8
  %86 = bitcast i8* %85 to i64*
  %87 = getelementptr inbounds i64, i64* %86, i64 1
  %88 = bitcast i64* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = load i64**, i64*** %ptr_right
  %91 = bitcast i64** %90 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 1
  %93 = bitcast i64* %92 to i8**
  %94 = load i8*, i8** %93, align 8
  %95 = bitcast i8* %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 2
  %97 = bitcast i64* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = load i64**, i64*** %ptr_right
  %100 = bitcast i64** %99 to i64*
  %101 = getelementptr inbounds i64, i64* %100, i64 1
  %102 = bitcast i64* %101 to i8**
  %103 = load i8*, i8** %102, align 8
  %104 = bitcast i8* %103 to i64*
  %105 = getelementptr inbounds i64, i64* %104, i64 3
  %106 = bitcast i64* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = call i64** @alloc_span(i64 %80, i64 %89, i64 %98, i64 %107)
  store i64** %108, i64*** %ptr_span
  %109 = call i8* @malloc(i64 24)
  %110 = bitcast i8* %109 to i64*
  %111 = load i64**, i64*** %ptr_left
  %112 = bitcast i64* %110 to i64*
  %113 = getelementptr inbounds i64, i64* %112, i64 0
  %114 = bitcast i64* %113 to i64***
  store i64** %111, i64*** %114, align 8
  %115 = bitcast i64* %110 to i64*
  %116 = getelementptr inbounds i64, i64* %115, i64 1
  %117 = bitcast i64* %116 to i64**
  store i64* %40, i64** %117, align 8
  %118 = load i64**, i64*** %ptr_right
  %119 = bitcast i64* %110 to i64*
  %120 = getelementptr inbounds i64, i64* %119, i64 2
  %121 = bitcast i64* %120 to i64***
  store i64** %118, i64*** %121, align 8
  %122 = call i8* @malloc(i64 16)
  %123 = bitcast i8* %122 to i64*
  store i64* %123, i64*** %ptr_expr
  %124 = load i64**, i64*** %ptr_expr
  %125 = load i64**, i64*** %ptr_span
  %126 = bitcast i64** %124 to i64*
  %127 = getelementptr inbounds i64, i64* %126, i64 1
  %128 = bitcast i64* %127 to i64***
  store i64** %125, i64*** %128, align 8
  %129 = call i8* @malloc(i64 24)
  %130 = bitcast i8* %129 to i64*
  %131 = load i64, i64* %110
  store i64 %131, i64* %130
  %132 = call i8* @malloc(i64 16)
  %133 = bitcast i8* %132 to i64*
  %134 = getelementptr inbounds i64, i64* %133, i64 0
  store i64 1, i64* %134
  %135 = getelementptr inbounds i64, i64* %133, i64 1
  %136 = bitcast i64* %135 to i64**
  store i64* %130, i64** %136
  %137 = load i64**, i64*** %ptr_expr
  %138 = bitcast i64** %137 to i64*
  %139 = getelementptr inbounds i64, i64* %138, i64 0
  %140 = bitcast i64* %139 to i64**
  store i64* %133, i64** %140, align 8
  %141 = load i64**, i64*** %ptr_expr
  store i64** %141, i64*** %ptr_left
  br label %when_end_11
when_end_11:
  br label %while_cond_4
while_end_6:
  %142 = load i64**, i64*** %ptr_left
  store i64** %142, i8* null
  ret i8* null
unreachable_15:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_generic_params(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = call i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to i64*
  %3 = call i64** @new_list_String(i64 2, i64* %2)
  %4 = load i64**, i64*** %ptr_p
  %5 = bitcast i64** %4 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 1
  %7 = bitcast i64* %6 to i8**
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 0
  %11 = bitcast i64* %10 to i8**
  %12 = load i8*, i8** %11, align 8
  %13 = call i1 @check_token(i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.130, i64 0, i64 0))
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %14)
  %15 = load i64**, i64*** %ptr_p
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 1
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast i8* %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 0
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = call i1 @check_token(i8* %23, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.131, i64 0, i64 0))
  %25 = xor i1 %24, 1
  br i1 %25, label %then_2, label %end_if_3
then_2:
  %26 = load i64**, i64*** %ptr_p
  %27 = call i8* @consume_ident(i64** %26, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.132, i64 0, i64 0))
  %28 = call i32 @strcmp(i8* %27, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.133, i64 0, i64 0))
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %then_4, label %end_if_5
then_4:
  ret i8* null
unreachable_6:
  br label %end_if_5
end_if_5:
  call void @list_push_String(i64** %3, i8* %27)
  br label %while_cond_7
while_cond_7:
  %30 = load i64**, i64*** %ptr_p
  %31 = bitcast i64** %30 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 1
  %33 = bitcast i64* %32 to i8**
  %34 = load i8*, i8** %33, align 8
  %35 = bitcast i8* %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 0
  %37 = bitcast i64* %36 to i8**
  %38 = load i8*, i8** %37, align 8
  %39 = call i1 @check_token(i8* %38, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.134, i64 0, i64 0))
  br i1 %39, label %while_body_8, label %while_end_9
while_body_8:
  %40 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %40)
  %41 = load i64**, i64*** %ptr_p
  %42 = call i8* @consume_ident(i64** %41, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.135, i64 0, i64 0))
  %43 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.136, i64 0, i64 0))
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %then_10, label %end_if_11
then_10:
  store i8* null, i8* null
  ret i8* null
unreachable_12:
  br label %end_if_11
end_if_11:
  call void @list_push_String(i64** %3, i8* %42)
  br label %while_cond_7
while_end_9:
  br label %end_if_3
end_if_3:
  %45 = load i64**, i64*** %ptr_p
  %46 = call i1 @consume(i64** %45, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.137, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.138, i64 0, i64 0))
  br label %end_if_1
end_if_1:
  store i64** %3, i8* null
  ret i8* null
unreachable_13:
  ret i64** null
}

define i64** @parse_type(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64**, i64*** %ptr_p
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  store i1 0, i1* %ptr_is_ptr
  store i1 0, i1* %ptr_is_nullable
  %19 = load i64**, i64*** %ptr_p
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 1
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = bitcast i8* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = call i1 @check_token(i8* %27, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.139, i64 0, i64 0))
  br i1 %28, label %then_0, label %end_if_1
then_0:
  %29 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %29)
  store i1 1, i1* %ptr_is_nullable
  br label %end_if_1
end_if_1:
  %30 = load i64**, i64*** %ptr_p
  %31 = bitcast i64** %30 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 1
  %33 = bitcast i64* %32 to i8**
  %34 = load i8*, i8** %33, align 8
  %35 = bitcast i8* %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 0
  %37 = bitcast i64* %36 to i8**
  %38 = load i8*, i8** %37, align 8
  %39 = call i1 @check_token(i8* %38, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.140, i64 0, i64 0))
  br i1 %39, label %then_2, label %end_if_3
then_2:
  %40 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %40)
  store i1 1, i1* %ptr_is_ptr
  br label %end_if_3
end_if_3:
  %41 = load i64**, i64*** %ptr_p
  %42 = call i8* @consume_ident(i64** %41, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.141, i64 0, i64 0))
  %43 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.142, i64 0, i64 0))
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %then_4, label %end_if_5
then_4:
  ret i8* null
unreachable_6:
  br label %end_if_5
end_if_5:
  %45 = call i8* @malloc(i64 48)
  %46 = bitcast i8* %45 to i64*
  %47 = bitcast i64* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 0
  %49 = bitcast i64* %48 to i8**
  store i8* %42, i8** %49, align 8
  %50 = load i1, i1* %ptr_is_ptr
  %51 = bitcast i64* %46 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 4
  %53 = bitcast i64* %52 to i1*
  store i1 %50, i1* %53, align 8
  %54 = load i1, i1* %ptr_is_nullable
  %55 = bitcast i64* %46 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 5
  %57 = bitcast i64* %56 to i1*
  store i1 %54, i1* %57, align 8
  %58 = bitcast i64* %46 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 2
  %60 = bitcast i64* %59 to i1*
  store i1 0, i1* %60, align 8
  %61 = bitcast i64* %46 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 3
  %63 = bitcast i64* %62 to i64*
  store i64 0, i64* %63, align 8
  %64 = call i8* @malloc(i64 16)
  %65 = bitcast i8* %64 to i64*
  %66 = call i64** @new_list_Spanned_Type(i64 0, i64* %65)
  %67 = call i64** @new_list_Spanned_Type(i64 0, i64* %65)
  %68 = bitcast i64* %46 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 1
  %70 = bitcast i64* %69 to i64***
  store i64** %67, i64*** %70, align 8
  %71 = load i64**, i64*** %ptr_p
  %72 = bitcast i64** %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 1
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = bitcast i8* %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64**, i64*** %ptr_p
  %81 = bitcast i64** %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 1
  %83 = bitcast i64* %82 to i8**
  %84 = load i8*, i8** %83, align 8
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 2
  %87 = bitcast i64* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = call i64** @alloc_span(i64 %9, i64 %18, i64 %79, i64 %88)
  store i64** %89, i64*** %ptr_span
  %90 = call i64 @alloc_spanned(i64 %Type)
  %91 = load i64, i64* %46
  %92 = load i64**, i64*** %ptr_span
  %93 = call i64 @unknown(i64 %91, i64** %92)
  store i64 %93, i8* null
  ret i8* null
unreachable_7:
  ret i64** null
}

define i64** @parse_param(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  store i1 0, i1* %ptr_is_mut
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = call i1 @check_token(i8* %9, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.143, i64 0, i64 0))
  br i1 %10, label %then_0, label %end_if_1
then_0:
  %11 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %11)
  store i1 1, i1* %ptr_is_mut
  br label %end_if_1
end_if_1:
  %12 = load i64**, i64*** %ptr_p
  %13 = call i8* @consume_ident(i64** %12, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.144, i64 0, i64 0))
  %14 = call i32 @strcmp(i8* %13, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.145, i64 0, i64 0))
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %then_2, label %end_if_3
then_2:
  ret i8* null
unreachable_4:
  br label %end_if_3
end_if_3:
  %16 = load i64**, i64*** %ptr_p
  %17 = call i1 @consume(i64** %16, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.146, i64 0, i64 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.147, i64 0, i64 0))
  %18 = xor i1 %17, 1
  br i1 %18, label %then_5, label %end_if_6
then_5:
  store i8* null, i8* null
  ret i8* null
unreachable_7:
  br label %end_if_6
end_if_6:
  %19 = load i64**, i64*** %ptr_p
  %20 = call i64** @parse_type(i64** %19)
  %21 = icmp eq i64** %20, null
  br i1 %21, label %when_none_9, label %when_val_10
when_none_9:
  store i8* null, i8* null
  ret i8* null
unreachable_11:
  br label %when_end_8
when_val_10:
  %22 = call i8* @malloc(i64 24)
  %23 = bitcast i8* %22 to i64*
  %24 = load i1, i1* %ptr_is_mut
  %25 = bitcast i64* %23 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 0
  %27 = bitcast i64* %26 to i1*
  store i1 %24, i1* %27, align 8
  %28 = bitcast i64* %23 to i64*
  %29 = getelementptr inbounds i64, i64* %28, i64 1
  %30 = bitcast i64* %29 to i8**
  store i8* %13, i8** %30, align 8
  %31 = bitcast i64* %23 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 2
  %33 = bitcast i64* %32 to i64***
  store i64** %20, i64*** %33, align 8
  store i64* %23, i8* null
  ret i8* null
unreachable_12:
  br label %when_end_8
when_end_8:
  store i8* null, i8* null
  ret i8* null
unreachable_13:
  ret i64** null
}

define i64** @parse_if_stmt(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.148, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.149, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %4 = load i64**, i64*** %ptr_p
  %5 = call i64** @parse_expression(i64** %4)
  store i64** %5, i64*** %ptr_condition_opt
  %6 = load i64**, i64*** %ptr_condition_opt
  %7 = icmp eq i64** %6, null
  br i1 %7, label %when_none_4, label %when_val_5
when_none_4:
  store i8* null, i8* null
  ret i8* null
unreachable_6:
  br label %when_end_3
when_val_5:
  %8 = load i64**, i64*** %ptr_condition_opt
  store i64** %8, i64*** %ptr_c
  %9 = load i64**, i64*** %ptr_c
  store i64** %9, i64*** %ptr_condition
  br label %when_end_3
when_end_3:
  %10 = load i64**, i64*** %ptr_p
  %11 = call i64** @parse_block(i64** %10)
  store i64** %11, i64*** %ptr_then_block_opt
  %12 = load i64**, i64*** %ptr_then_block_opt
  %13 = icmp eq i64** %12, null
  br i1 %13, label %when_none_8, label %when_val_9
when_none_8:
  store i8* null, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_7
when_val_9:
  %14 = load i64**, i64*** %ptr_then_block_opt
  store i64** %14, i64*** %ptr_b
  %15 = load i64**, i64*** %ptr_b
  store i64** %15, i64*** %ptr_then_block
  br label %when_end_7
when_end_7:
  %16 = load i64**, i64*** %ptr_p
  %17 = bitcast i64** %16 to i64*
  %18 = getelementptr inbounds i64, i64* %17, i64 1
  %19 = bitcast i64* %18 to i8**
  %20 = load i8*, i8** %19, align 8
  %21 = bitcast i8* %20 to i64*
  %22 = getelementptr inbounds i64, i64* %21, i64 0
  %23 = bitcast i64* %22 to i8**
  %24 = load i8*, i8** %23, align 8
  %25 = call i1 @check_token(i8* %24, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.150, i64 0, i64 0))
  br i1 %25, label %then_11, label %end_if_12
then_11:
  %26 = load i64**, i64*** %ptr_p
  %27 = bitcast i64** %26 to i64*
  %28 = getelementptr inbounds i64, i64* %27, i64 1
  %29 = bitcast i64* %28 to i8**
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 1
  %33 = bitcast i64* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = load i64**, i64*** %ptr_p
  %36 = bitcast i64** %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 1
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = bitcast i8* %39 to i64*
  %41 = getelementptr inbounds i64, i64* %40, i64 2
  %42 = bitcast i64* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %44)
  %45 = load i64**, i64*** %ptr_p
  %46 = bitcast i64** %45 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 1
  %48 = bitcast i64* %47 to i8**
  %49 = load i8*, i8** %48, align 8
  %50 = bitcast i8* %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i8**
  %53 = load i8*, i8** %52, align 8
  %54 = call i1 @check_token(i8* %53, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.151, i64 0, i64 0))
  br i1 %54, label %then_13, label %else_15
then_13:
  %55 = load i64**, i64*** %ptr_p
  %56 = call i64** @parse_if_stmt(i64** %55)
  %57 = icmp eq i64** %56, null
  br i1 %57, label %when_none_17, label %when_val_18
when_none_17:
  br label %when_end_16
when_val_18:
  store i64** %56, i64*** %ptr_ei
  %58 = load i64**, i64*** %ptr_p
  %59 = bitcast i64** %58 to i64*
  %60 = getelementptr inbounds i64, i64* %59, i64 1
  %61 = bitcast i64* %60 to i8**
  %62 = load i8*, i8** %61, align 8
  %63 = bitcast i8* %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 1
  %65 = bitcast i64* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = load i64**, i64*** %ptr_p
  %68 = bitcast i64** %67 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 1
  %70 = bitcast i64* %69 to i8**
  %71 = load i8*, i8** %70, align 8
  %72 = bitcast i8* %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 2
  %74 = bitcast i64* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = call i64** @alloc_span(i64 %34, i64 %43, i64 %66, i64 %75)
  store i64** %76, i64*** %ptr_span
  %77 = call i8* @malloc(i64 16)
  %78 = bitcast i8* %77 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 0
  store i64 4, i64* %79
  %80 = load i64**, i64*** %ptr_ei
  %81 = getelementptr inbounds i64, i64* %78, i64 1
  %82 = bitcast i64* %81 to i64***
  store i64** %80, i64*** %82
  %83 = call i64 @alloc_spanned(i64 %ElseBranch)
  %84 = load i64**, i64*** %ptr_span
  %85 = call i64 @unknown(i64* %78, i64** %84)
  store i64 %85, i8* null
  br label %when_end_16
when_end_16:
  br label %end_if_14
else_15:
  %86 = load i64**, i64*** %ptr_p
  %87 = call i64** @parse_block(i64** %86)
  %88 = icmp eq i64** %87, null
  br i1 %88, label %when_none_20, label %when_val_21
when_none_20:
  br label %when_end_19
when_val_21:
  store i64** %87, i64*** %ptr_eb
  %89 = load i64**, i64*** %ptr_p
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 1
  %92 = bitcast i64* %91 to i8**
  %93 = load i8*, i8** %92, align 8
  %94 = bitcast i8* %93 to i64*
  %95 = getelementptr inbounds i64, i64* %94, i64 1
  %96 = bitcast i64* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = load i64**, i64*** %ptr_p
  %99 = bitcast i64** %98 to i64*
  %100 = getelementptr inbounds i64, i64* %99, i64 1
  %101 = bitcast i64* %100 to i8**
  %102 = load i8*, i8** %101, align 8
  %103 = bitcast i8* %102 to i64*
  %104 = getelementptr inbounds i64, i64* %103, i64 2
  %105 = bitcast i64* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = call i64** @alloc_span(i64 %34, i64 %43, i64 %97, i64 %106)
  store i64** %107, i64*** %ptr_span
  %108 = call i8* @malloc(i64 8)
  %109 = bitcast i8* %108 to i64*
  store i64* %109, i64*** %ptr_blk_ptr
  %110 = load i64**, i64*** %ptr_eb
  %111 = bitcast i64** %110 to i64*
  %112 = getelementptr inbounds i64, i64* %111, i64 0
  %113 = bitcast i64* %112 to i8**
  %114 = load i8*, i8** %113, align 8
  %115 = load i64**, i64*** %ptr_blk_ptr
  store i8* %114, i64** %115
  %116 = call i8* @malloc(i64 16)
  %117 = bitcast i8* %116 to i64*
  %118 = getelementptr inbounds i64, i64* %117, i64 0
  store i64 1, i64* %118
  %119 = load i64**, i64*** %ptr_blk_ptr
  %120 = getelementptr inbounds i64, i64* %117, i64 1
  %121 = bitcast i64* %120 to i64***
  store i64** %119, i64*** %121
  store i64* %117, i64* %78
  %122 = call i64 @alloc_spanned(i64 %ElseBranch)
  %123 = load i64**, i64*** %ptr_span
  %124 = call i64 @unknown(i64* %78, i64** %123)
  store i64 %124, i8* null
  br label %when_end_19
when_end_19:
  br label %end_if_14
end_if_14:
  br label %end_if_12
end_if_12:
  %125 = load i64**, i64*** %ptr_condition
  %126 = icmp eq i64** %125, null
  br i1 %126, label %when_none_23, label %when_val_24
when_none_23:
  br label %when_end_22
when_val_24:
  %127 = load i64**, i64*** %ptr_condition
  store i64** %127, i64*** %ptr_c
  %128 = load i64**, i64*** %ptr_then_block
  %129 = icmp eq i64** %128, null
  br i1 %129, label %when_none_26, label %when_val_27
when_none_26:
  br label %when_end_25
when_val_27:
  %130 = load i64**, i64*** %ptr_then_block
  store i64** %130, i64*** %ptr_t
  %131 = call i8* @malloc(i64 24)
  %132 = bitcast i8* %131 to i64*
  store i64* %132, i64*** %ptr_stmt
  %133 = load i64**, i64*** %ptr_stmt
  %134 = load i64**, i64*** %ptr_c
  %135 = bitcast i64** %133 to i64*
  %136 = getelementptr inbounds i64, i64* %135, i64 0
  %137 = bitcast i64* %136 to i64***
  store i64** %134, i64*** %137, align 8
  %138 = load i64**, i64*** %ptr_stmt
  %139 = load i64**, i64*** %ptr_t
  %140 = bitcast i64** %138 to i64*
  %141 = getelementptr inbounds i64, i64* %140, i64 1
  %142 = bitcast i64* %141 to i64***
  store i64** %139, i64*** %142, align 8
  %143 = load i64**, i64*** %ptr_stmt
  %144 = bitcast i64** %143 to i64*
  %145 = getelementptr inbounds i64, i64* %144, i64 2
  %146 = bitcast i64* %145 to i8**
  store i8* null, i8** %146, align 8
  %147 = load i64**, i64*** %ptr_stmt
  store i64** %147, i8* null
  ret i8* null
unreachable_28:
  br label %when_end_25
when_end_25:
  br label %when_end_22
when_end_22:
  store i8* null, i8* null
  ret i8* null
unreachable_29:
  ret i64** null
}

define i64** @parse_while_stmt(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.152, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.153, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %4 = load i64**, i64*** %ptr_p
  %5 = call i64** @parse_expression(i64** %4)
  store i64** %5, i64*** %ptr_condition_opt
  %6 = load i64**, i64*** %ptr_p
  %7 = call i64** @parse_block(i64** %6)
  store i64** %7, i64*** %ptr_block_opt
  %8 = load i64**, i64*** %ptr_condition_opt
  %9 = icmp eq i64** %8, null
  br i1 %9, label %when_none_4, label %when_val_5
when_none_4:
  store i8* null, i8* null
  ret i8* null
unreachable_6:
  br label %when_end_3
when_val_5:
  %10 = load i64**, i64*** %ptr_condition_opt
  store i64** %10, i64*** %ptr_c
  %11 = load i64**, i64*** %ptr_block_opt
  %12 = icmp eq i64** %11, null
  br i1 %12, label %when_none_8, label %when_val_9
when_none_8:
  store i8* null, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_7
when_val_9:
  %13 = load i64**, i64*** %ptr_block_opt
  store i64** %13, i64*** %ptr_b
  %14 = call i8* @malloc(i64 16)
  %15 = bitcast i8* %14 to i64*
  store i64* %15, i64*** %ptr_stmt
  %16 = load i64**, i64*** %ptr_stmt
  %17 = load i64**, i64*** %ptr_c
  %18 = bitcast i64** %16 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 0
  %20 = bitcast i64* %19 to i64***
  store i64** %17, i64*** %20, align 8
  %21 = load i64**, i64*** %ptr_stmt
  %22 = load i64**, i64*** %ptr_b
  %23 = bitcast i64** %21 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 1
  %25 = bitcast i64* %24 to i64***
  store i64** %22, i64*** %25, align 8
  %26 = load i64**, i64*** %ptr_stmt
  store i64** %26, i8* null
  ret i8* null
unreachable_11:
  br label %when_end_7
when_end_7:
  br label %when_end_3
when_end_3:
  store i8* null, i8* null
  ret i8* null
unreachable_12:
  ret i64** null
}

define i64** @parse_return_stmt(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.154, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.155, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  store i8* null, i64*** %ptr_value
  %4 = load i64**, i64*** %ptr_p
  %5 = bitcast i64** %4 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 1
  %7 = bitcast i64* %6 to i8**
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 0
  %11 = bitcast i64* %10 to i8**
  %12 = load i8*, i8** %11, align 8
  %13 = call i1 @check_token(i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.156, i64 0, i64 0))
  %14 = xor i1 %13, 1
  %15 = load i64**, i64*** %ptr_p
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 1
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast i8* %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 0
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = call i1 @check_token(i8* %23, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.157, i64 0, i64 0))
  %25 = xor i1 %24, 1
  %26 = and i1 %14, %25
  br i1 %26, label %then_3, label %end_if_4
then_3:
  %27 = load i64**, i64*** %ptr_p
  %28 = call i64** @parse_expression(i64** %27)
  store i64** %28, i64*** %ptr_value
  br label %end_if_4
end_if_4:
  %29 = call i8* @malloc(i64 8)
  %30 = bitcast i8* %29 to i64*
  store i64* %30, i64*** %ptr_stmt
  %31 = load i64**, i64*** %ptr_stmt
  %32 = load i64**, i64*** %ptr_value
  %33 = bitcast i64** %31 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 0
  %35 = bitcast i64* %34 to i64***
  store i64** %32, i64*** %35, align 8
  %36 = load i64**, i64*** %ptr_stmt
  store i64** %36, i8* null
  ret i8* null
unreachable_5:
  ret i64** null
}

define i64** @parse_free_stmt(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.158, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.159, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %4 = load i64**, i64*** %ptr_p
  %5 = call i64** @parse_expression(i64** %4)
  ret i64** %5
unreachable_3:
  ret i64** null
}

define i64** @parse_statement(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64**, i64*** %ptr_p
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = load i64**, i64*** %ptr_p
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 1
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = bitcast i8* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = call i1 @check_token(i8* %27, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.160, i64 0, i64 0))
  %29 = load i64**, i64*** %ptr_p
  %30 = bitcast i64** %29 to i64*
  %31 = getelementptr inbounds i64, i64* %30, i64 1
  %32 = bitcast i64* %31 to i8**
  %33 = load i8*, i8** %32, align 8
  %34 = bitcast i8* %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 0
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8
  %38 = call i1 @check_token(i8* %37, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.161, i64 0, i64 0))
  %39 = or i1 %28, %38
  br i1 %39, label %then_0, label %else_2
then_0:
  %40 = load i64**, i64*** %ptr_p
  %41 = call i64** @parse_var_decl(i64** %40)
  %42 = icmp eq i64** %41, null
  br i1 %42, label %when_none_4, label %when_val_5
when_none_4:
  br label %when_end_3
when_val_5:
  store i64** %41, i64*** %ptr_v
  %43 = call i8* @malloc(i64 16)
  %44 = bitcast i8* %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 0
  store i64 4, i64* %45
  %46 = load i64**, i64*** %ptr_v
  %47 = getelementptr inbounds i64, i64* %44, i64 1
  %48 = bitcast i64* %47 to i64***
  store i64** %46, i64*** %48
  store i64* %44, i8* null
  br label %when_end_3
when_end_3:
  br label %end_if_1
else_2:
  %49 = load i64**, i64*** %ptr_p
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 1
  %52 = bitcast i64* %51 to i8**
  %53 = load i8*, i8** %52, align 8
  %54 = bitcast i8* %53 to i64*
  %55 = getelementptr inbounds i64, i64* %54, i64 0
  %56 = bitcast i64* %55 to i8**
  %57 = load i8*, i8** %56, align 8
  %58 = call i1 @check_token(i8* %57, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.162, i64 0, i64 0))
  br i1 %58, label %then_6, label %else_8
then_6:
  %59 = load i64**, i64*** %ptr_p
  %60 = call i64** @parse_if_stmt(i64** %59)
  %61 = icmp eq i64** %60, null
  br i1 %61, label %when_none_10, label %when_val_11
when_none_10:
  br label %when_end_9
when_val_11:
  %62 = call i8* @malloc(i64 16)
  %63 = bitcast i8* %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 0
  store i64 4, i64* %64
  %65 = getelementptr inbounds i64, i64* %63, i64 1
  %66 = bitcast i64* %65 to i64***
  store i64** %60, i64*** %66
  store i64* %63, i8* null
  br label %when_end_9
when_end_9:
  br label %end_if_7
else_8:
  %67 = load i64**, i64*** %ptr_p
  %68 = bitcast i64** %67 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 1
  %70 = bitcast i64* %69 to i8**
  %71 = load i8*, i8** %70, align 8
  %72 = bitcast i8* %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 0
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = call i1 @check_token(i8* %75, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.163, i64 0, i64 0))
  br i1 %76, label %then_12, label %else_14
then_12:
  %77 = load i64**, i64*** %ptr_p
  %78 = call i64** @parse_while_stmt(i64** %77)
  %79 = icmp eq i64** %78, null
  br i1 %79, label %when_none_16, label %when_val_17
when_none_16:
  br label %when_end_15
when_val_17:
  store i64** %78, i64*** %ptr_w
  %80 = call i8* @malloc(i64 16)
  %81 = bitcast i8* %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 0
  store i64 6, i64* %82
  %83 = load i64**, i64*** %ptr_w
  %84 = getelementptr inbounds i64, i64* %81, i64 1
  %85 = bitcast i64* %84 to i64***
  store i64** %83, i64*** %85
  store i64* %81, i8* null
  br label %when_end_15
when_end_15:
  br label %end_if_13
else_14:
  %86 = load i64**, i64*** %ptr_p
  %87 = bitcast i64** %86 to i64*
  %88 = getelementptr inbounds i64, i64* %87, i64 1
  %89 = bitcast i64* %88 to i8**
  %90 = load i8*, i8** %89, align 8
  %91 = bitcast i8* %90 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 0
  %93 = bitcast i64* %92 to i8**
  %94 = load i8*, i8** %93, align 8
  %95 = call i1 @check_token(i8* %94, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.164, i64 0, i64 0))
  br i1 %95, label %then_18, label %else_20
then_18:
  %96 = load i64**, i64*** %ptr_p
  %97 = call i64** @parse_return_stmt(i64** %96)
  %98 = icmp eq i64** %97, null
  br i1 %98, label %when_none_22, label %when_val_23
when_none_22:
  br label %when_end_21
when_val_23:
  store i64** %97, i64*** %ptr_r
  %99 = call i8* @malloc(i64 16)
  %100 = bitcast i8* %99 to i64*
  %101 = getelementptr inbounds i64, i64* %100, i64 0
  store i64 7, i64* %101
  %102 = load i64**, i64*** %ptr_r
  %103 = getelementptr inbounds i64, i64* %100, i64 1
  %104 = bitcast i64* %103 to i64***
  store i64** %102, i64*** %104
  store i64* %100, i8* null
  br label %when_end_21
when_end_21:
  br label %end_if_19
else_20:
  %105 = load i64**, i64*** %ptr_p
  %106 = bitcast i64** %105 to i64*
  %107 = getelementptr inbounds i64, i64* %106, i64 1
  %108 = bitcast i64* %107 to i8**
  %109 = load i8*, i8** %108, align 8
  %110 = bitcast i8* %109 to i64*
  %111 = getelementptr inbounds i64, i64* %110, i64 0
  %112 = bitcast i64* %111 to i8**
  %113 = load i8*, i8** %112, align 8
  %114 = call i1 @check_token(i8* %113, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.165, i64 0, i64 0))
  br i1 %114, label %then_24, label %else_26
then_24:
  %115 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %115)
  %116 = call i8* @malloc(i64 8)
  %117 = bitcast i8* %116 to i64*
  %118 = getelementptr inbounds i64, i64* %117, i64 0
  store i64 9, i64* %118
  store i64* %117, i8* null
  br label %end_if_25
else_26:
  %119 = load i64**, i64*** %ptr_p
  %120 = bitcast i64** %119 to i64*
  %121 = getelementptr inbounds i64, i64* %120, i64 1
  %122 = bitcast i64* %121 to i8**
  %123 = load i8*, i8** %122, align 8
  %124 = bitcast i8* %123 to i64*
  %125 = getelementptr inbounds i64, i64* %124, i64 0
  %126 = bitcast i64* %125 to i8**
  %127 = load i8*, i8** %126, align 8
  %128 = call i1 @check_token(i8* %127, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.166, i64 0, i64 0))
  br i1 %128, label %then_27, label %else_29
then_27:
  %129 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %129)
  %130 = call i8* @malloc(i64 8)
  %131 = bitcast i8* %130 to i64*
  %132 = getelementptr inbounds i64, i64* %131, i64 0
  store i64 10, i64* %132
  store i64* %131, i8* null
  br label %end_if_28
else_29:
  %133 = load i64**, i64*** %ptr_p
  %134 = bitcast i64** %133 to i64*
  %135 = getelementptr inbounds i64, i64* %134, i64 1
  %136 = bitcast i64* %135 to i8**
  %137 = load i8*, i8** %136, align 8
  %138 = bitcast i8* %137 to i64*
  %139 = getelementptr inbounds i64, i64* %138, i64 0
  %140 = bitcast i64* %139 to i8**
  %141 = load i8*, i8** %140, align 8
  %142 = call i1 @check_token(i8* %141, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.167, i64 0, i64 0))
  br i1 %142, label %then_30, label %else_32
then_30:
  %143 = load i64**, i64*** %ptr_p
  %144 = call i64** @parse_free_stmt(i64** %143)
  %145 = icmp eq i64** %144, null
  br i1 %145, label %when_none_34, label %when_val_35
when_none_34:
  br label %when_end_33
when_val_35:
  store i64** %144, i64*** %ptr_f
  %146 = call i8* @malloc(i64 16)
  %147 = bitcast i8* %146 to i64*
  %148 = getelementptr inbounds i64, i64* %147, i64 0
  store i64 50, i64* %148
  %149 = load i64**, i64*** %ptr_f
  %150 = getelementptr inbounds i64, i64* %147, i64 1
  %151 = bitcast i64* %150 to i64***
  store i64** %149, i64*** %151
  store i64* %147, i8* null
  br label %when_end_33
when_end_33:
  br label %end_if_31
else_32:
  %152 = load i64**, i64*** %ptr_p
  %153 = call i64** @parse_expression(i64** %152)
  %154 = icmp eq i64** %153, null
  br i1 %154, label %when_none_37, label %when_val_38
when_none_37:
  br label %when_end_36
when_val_38:
  store i64** %153, i64*** %ptr_expr
  store i1 0, i1* %ptr_is_assign
  %155 = call i8* @malloc(i64 8)
  %156 = bitcast i8* %155 to i64*
  %157 = getelementptr inbounds i64, i64* %156, i64 0
  store i64 30, i64* %157
  %158 = load i64**, i64*** %ptr_p
  %159 = bitcast i64** %158 to i64*
  %160 = getelementptr inbounds i64, i64* %159, i64 1
  %161 = bitcast i64* %160 to i8**
  %162 = load i8*, i8** %161, align 8
  %163 = bitcast i8* %162 to i64*
  %164 = getelementptr inbounds i64, i64* %163, i64 0
  %165 = bitcast i64* %164 to i8**
  %166 = load i8*, i8** %165, align 8
  %167 = call i1 @check_token(i8* %166, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.168, i64 0, i64 0))
  br i1 %167, label %then_39, label %else_41
then_39:
  store i1 1, i1* %ptr_is_assign
  %168 = call i8* @malloc(i64 8)
  %169 = bitcast i8* %168 to i64*
  %170 = getelementptr inbounds i64, i64* %169, i64 0
  store i64 30, i64* %170
  store i64* %169, i64* %156
  br label %end_if_40
else_41:
  %171 = load i64**, i64*** %ptr_p
  %172 = bitcast i64** %171 to i64*
  %173 = getelementptr inbounds i64, i64* %172, i64 1
  %174 = bitcast i64* %173 to i8**
  %175 = load i8*, i8** %174, align 8
  %176 = bitcast i8* %175 to i64*
  %177 = getelementptr inbounds i64, i64* %176, i64 0
  %178 = bitcast i64* %177 to i8**
  %179 = load i8*, i8** %178, align 8
  %180 = call i1 @check_token(i8* %179, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.169, i64 0, i64 0))
  br i1 %180, label %then_42, label %else_44
then_42:
  store i1 1, i1* %ptr_is_assign
  %181 = call i8* @malloc(i64 8)
  %182 = bitcast i8* %181 to i64*
  %183 = getelementptr inbounds i64, i64* %182, i64 0
  store i64 31, i64* %183
  store i64* %182, i64* %156
  br label %end_if_43
else_44:
  %184 = load i64**, i64*** %ptr_p
  %185 = bitcast i64** %184 to i64*
  %186 = getelementptr inbounds i64, i64* %185, i64 1
  %187 = bitcast i64* %186 to i8**
  %188 = load i8*, i8** %187, align 8
  %189 = bitcast i8* %188 to i64*
  %190 = getelementptr inbounds i64, i64* %189, i64 0
  %191 = bitcast i64* %190 to i8**
  %192 = load i8*, i8** %191, align 8
  %193 = call i1 @check_token(i8* %192, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.170, i64 0, i64 0))
  br i1 %193, label %then_45, label %else_47
then_45:
  store i1 1, i1* %ptr_is_assign
  %194 = call i8* @malloc(i64 8)
  %195 = bitcast i8* %194 to i64*
  %196 = getelementptr inbounds i64, i64* %195, i64 0
  store i64 32, i64* %196
  store i64* %195, i64* %156
  br label %end_if_46
else_47:
  %197 = load i64**, i64*** %ptr_p
  %198 = bitcast i64** %197 to i64*
  %199 = getelementptr inbounds i64, i64* %198, i64 1
  %200 = bitcast i64* %199 to i8**
  %201 = load i8*, i8** %200, align 8
  %202 = bitcast i8* %201 to i64*
  %203 = getelementptr inbounds i64, i64* %202, i64 0
  %204 = bitcast i64* %203 to i8**
  %205 = load i8*, i8** %204, align 8
  %206 = call i1 @check_token(i8* %205, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.171, i64 0, i64 0))
  br i1 %206, label %then_48, label %else_50
then_48:
  store i1 1, i1* %ptr_is_assign
  %207 = call i8* @malloc(i64 8)
  %208 = bitcast i8* %207 to i64*
  %209 = getelementptr inbounds i64, i64* %208, i64 0
  store i64 33, i64* %209
  store i64* %208, i64* %156
  br label %end_if_49
else_50:
  %210 = load i64**, i64*** %ptr_p
  %211 = bitcast i64** %210 to i64*
  %212 = getelementptr inbounds i64, i64* %211, i64 1
  %213 = bitcast i64* %212 to i8**
  %214 = load i8*, i8** %213, align 8
  %215 = bitcast i8* %214 to i64*
  %216 = getelementptr inbounds i64, i64* %215, i64 0
  %217 = bitcast i64* %216 to i8**
  %218 = load i8*, i8** %217, align 8
  %219 = call i1 @check_token(i8* %218, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.172, i64 0, i64 0))
  br i1 %219, label %then_51, label %end_if_52
then_51:
  store i1 1, i1* %ptr_is_assign
  %220 = call i8* @malloc(i64 8)
  %221 = bitcast i8* %220 to i64*
  %222 = getelementptr inbounds i64, i64* %221, i64 0
  store i64 34, i64* %222
  store i64* %221, i64* %156
  br label %end_if_52
end_if_52:
  br label %end_if_49
end_if_49:
  br label %end_if_46
end_if_46:
  br label %end_if_43
end_if_43:
  br label %end_if_40
end_if_40:
  %223 = load i1, i1* %ptr_is_assign
  br i1 %223, label %then_53, label %else_55
then_53:
  %224 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %224)
  %225 = load i64**, i64*** %ptr_p
  %226 = call i64** @parse_expression(i64** %225)
  store i64** %226, i64*** %ptr_val_opt
  %227 = load i64**, i64*** %ptr_val_opt
  %228 = icmp eq i64** %227, null
  br i1 %228, label %when_none_57, label %when_val_58
when_none_57:
  br label %when_end_56
when_val_58:
  %229 = load i64**, i64*** %ptr_val_opt
  store i64** %229, i8** %ptr_val
  %230 = call i8* @malloc(i64 24)
  %231 = bitcast i8* %230 to i64*
  store i64* %231, i64*** %ptr_assign
  %232 = load i64**, i64*** %ptr_assign
  %233 = load i64**, i64*** %ptr_expr
  %234 = bitcast i64** %232 to i64*
  %235 = getelementptr inbounds i64, i64* %234, i64 0
  %236 = bitcast i64* %235 to i64***
  store i64** %233, i64*** %236, align 8
  %237 = load i64**, i64*** %ptr_assign
  %238 = bitcast i64** %237 to i64*
  %239 = getelementptr inbounds i64, i64* %238, i64 1
  %240 = bitcast i64* %239 to i64**
  store i64* %156, i64** %240, align 8
  %241 = load i64**, i64*** %ptr_assign
  %242 = load i8*, i8** %ptr_val
  %243 = bitcast i64** %241 to i64*
  %244 = getelementptr inbounds i64, i64* %243, i64 2
  %245 = bitcast i64* %244 to i8**
  store i8* %242, i8** %245, align 8
  %246 = call i8* @malloc(i64 16)
  %247 = bitcast i8* %246 to i64*
  %248 = getelementptr inbounds i64, i64* %247, i64 0
  store i64 1, i64* %248
  %249 = load i64**, i64*** %ptr_assign
  %250 = getelementptr inbounds i64, i64* %247, i64 1
  %251 = bitcast i64* %250 to i64***
  store i64** %249, i64*** %251
  store i64* %247, i8* null
  br label %when_end_56
when_end_56:
  br label %end_if_54
else_55:
  %252 = call i8* @malloc(i64 16)
  %253 = bitcast i8* %252 to i64*
  %254 = getelementptr inbounds i64, i64* %253, i64 0
  store i64 5, i64* %254
  %255 = load i64**, i64*** %ptr_expr
  %256 = getelementptr inbounds i64, i64* %253, i64 1
  %257 = bitcast i64* %256 to i64***
  store i64** %255, i64*** %257
  store i64* %253, i8* null
  br label %end_if_54
end_if_54:
  br label %when_end_36
when_end_36:
  br label %end_if_31
end_if_31:
  br label %end_if_28
end_if_28:
  br label %end_if_25
end_if_25:
  br label %end_if_19
end_if_19:
  br label %end_if_13
end_if_13:
  br label %end_if_7
end_if_7:
  br label %end_if_1
end_if_1:
  %258 = icmp eq i8* null, null
  br i1 %258, label %when_none_60, label %when_val_61
when_none_60:
  ret i8* null
unreachable_62:
  br label %when_end_59
when_val_61:
  store i8* null, i64*** %ptr_stmt
  %259 = load i64**, i64*** %ptr_p
  %260 = bitcast i64** %259 to i64*
  %261 = getelementptr inbounds i64, i64* %260, i64 1
  %262 = bitcast i64* %261 to i8**
  %263 = load i8*, i8** %262, align 8
  %264 = bitcast i8* %263 to i64*
  %265 = getelementptr inbounds i64, i64* %264, i64 1
  %266 = bitcast i64* %265 to i64*
  %267 = load i64, i64* %266, align 8
  %268 = load i64**, i64*** %ptr_p
  %269 = bitcast i64** %268 to i64*
  %270 = getelementptr inbounds i64, i64* %269, i64 1
  %271 = bitcast i64* %270 to i8**
  %272 = load i8*, i8** %271, align 8
  %273 = bitcast i8* %272 to i64*
  %274 = getelementptr inbounds i64, i64* %273, i64 2
  %275 = bitcast i64* %274 to i64*
  %276 = load i64, i64* %275, align 8
  %277 = call i64** @alloc_span(i64 %9, i64 %18, i64 %267, i64 %276)
  store i64** %277, i64*** %ptr_span
  %278 = call i64 @alloc_spanned(i64 %Statement)
  %279 = load i64**, i64*** %ptr_stmt
  %280 = load i64**, i64*** %ptr_span
  %281 = call i64 @unknown(i64** %279, i64** %280)
  store i64 %281, i8* null
  ret i8* null
unreachable_63:
  br label %when_end_59
when_end_59:
  store i8* null, i8* null
  ret i8* null
unreachable_64:
  ret i64** null
}

define i64** @parse_block(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64**, i64*** %ptr_p
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = load i64**, i64*** %ptr_p
  %20 = call i1 @consume(i64** %19, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.173, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.174, i64 0, i64 0))
  %21 = xor i1 %20, 1
  br i1 %21, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %22 = call i8* @malloc(i64 16)
  %23 = bitcast i8* %22 to i64*
  %24 = call i64** @new_list_Spanned_Statement(i64 4, i64* %23)
  store i64** %24, i64*** %ptr_statements
  br label %while_cond_3
while_cond_3:
  %25 = load i64**, i64*** %ptr_p
  %26 = bitcast i64** %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 1
  %28 = bitcast i64* %27 to i8**
  %29 = load i8*, i8** %28, align 8
  %30 = bitcast i8* %29 to i64*
  %31 = getelementptr inbounds i64, i64* %30, i64 0
  %32 = bitcast i64* %31 to i8**
  %33 = load i8*, i8** %32, align 8
  %34 = call i1 @check_token(i8* %33, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.175, i64 0, i64 0))
  %35 = xor i1 %34, 1
  %36 = load i64**, i64*** %ptr_p
  %37 = bitcast i64** %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 1
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  %41 = bitcast i8* %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 0
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = call i1 @check_token(i8* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.176, i64 0, i64 0))
  %46 = xor i1 %45, 1
  %47 = and i1 %35, %46
  br i1 %47, label %while_body_4, label %while_end_5
while_body_4:
  %48 = load i64**, i64*** %ptr_p
  %49 = call i64** @parse_statement(i64** %48)
  %50 = icmp eq i64** %49, null
  br i1 %50, label %when_none_7, label %when_val_8
when_none_7:
  %51 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %51)
  br label %when_end_6
when_val_8:
  store i64** %49, i64*** %ptr_stmt
  %52 = load i64**, i64*** %ptr_stmt
  %53 = load i64*, i64** %52
  %54 = load i64**, i64*** %ptr_statements
  call void @list_push_Spanned_Statement(i64** %54, i64* %53)
  br label %when_end_6
when_end_6:
  br label %while_cond_3
while_end_5:
  %55 = load i64**, i64*** %ptr_p
  %56 = call i1 @consume(i64** %55, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.177, i64 0, i64 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.178, i64 0, i64 0))
  %57 = call i8* @malloc(i64 8)
  %58 = bitcast i8* %57 to i64*
  %59 = load i64**, i64*** %ptr_statements
  %60 = bitcast i64* %58 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 0
  %62 = bitcast i64* %61 to i64***
  store i64** %59, i64*** %62, align 8
  %63 = load i64**, i64*** %ptr_p
  %64 = bitcast i64** %63 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 1
  %66 = bitcast i64* %65 to i8**
  %67 = load i8*, i8** %66, align 8
  %68 = bitcast i8* %67 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 1
  %70 = bitcast i64* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = load i64**, i64*** %ptr_p
  %73 = bitcast i64** %72 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 1
  %75 = bitcast i64* %74 to i8**
  %76 = load i8*, i8** %75, align 8
  %77 = bitcast i8* %76 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 2
  %79 = bitcast i64* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = call i64** @alloc_span(i64 %9, i64 %18, i64 %71, i64 %80)
  store i64** %81, i64*** %ptr_span
  %82 = call i64 @alloc_spanned(i64 %Block)
  %83 = load i64**, i64*** %ptr_span
  %84 = call i64 @unknown(i64* %58, i64** %83)
  store i64 %84, i8* null
  ret i8* null
unreachable_9:
  ret i64** null
}

define i64** @parse_fn_decl(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.179, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.180, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %4 = load i64**, i64*** %ptr_p
  %5 = call i8* @consume_ident(i64** %4, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.181, i64 0, i64 0))
  %6 = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.182, i64 0, i64 0))
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %then_3, label %end_if_4
then_3:
  store i8* null, i8* null
  ret i8* null
unreachable_5:
  br label %end_if_4
end_if_4:
  %8 = call i8* @malloc(i64 8)
  %9 = bitcast i8* %8 to i64*
  %10 = call i64** @new_list_String(i64 0, i64* %9)
  %11 = load i64**, i64*** %ptr_p
  %12 = call i1 @consume(i64** %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.183, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.184, i64 0, i64 0))
  %13 = xor i1 %12, 1
  br i1 %13, label %then_6, label %end_if_7
then_6:
  store i8* null, i8* null
  ret i8* null
unreachable_8:
  br label %end_if_7
end_if_7:
  %14 = call i8* @malloc(i64 24)
  %15 = bitcast i8* %14 to i64*
  %16 = call i64** @new_list_Param(i64 4, i64* %15)
  %17 = load i64**, i64*** %ptr_p
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = call i1 @check_token(i8* %25, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.185, i64 0, i64 0))
  %27 = xor i1 %26, 1
  br i1 %27, label %then_9, label %end_if_10
then_9:
  %28 = load i64**, i64*** %ptr_p
  %29 = call i64** @parse_param(i64** %28)
  %30 = load i64*, i64** %29
  %31 = icmp eq i64* %30, null
  br i1 %31, label %when_none_12, label %when_val_13
when_none_12:
  br label %when_end_11
when_val_13:
  %32 = load i64*, i64** %29
  %33 = load i64, i64* %32
  call void @list_push_Param(i64** %16, i64 %33)
  br label %when_end_11
when_end_11:
  br label %while_cond_14
while_cond_14:
  %34 = load i64**, i64*** %ptr_p
  %35 = bitcast i64** %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 1
  %37 = bitcast i64* %36 to i8**
  %38 = load i8*, i8** %37, align 8
  %39 = bitcast i8* %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 0
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = call i1 @check_token(i8* %42, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.186, i64 0, i64 0))
  br i1 %43, label %while_body_15, label %while_end_16
while_body_15:
  %44 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %44)
  %45 = load i64**, i64*** %ptr_p
  %46 = call i64** @parse_param(i64** %45)
  %47 = icmp eq i64** %46, null
  br i1 %47, label %when_none_18, label %when_val_19
when_none_18:
  br label %when_end_17
when_val_19:
  store i64** %46, i64*** %ptr_pr
  %48 = load i64**, i64*** %ptr_pr
  %49 = load i64*, i64** %48
  call void @list_push_Param(i64** %16, i64* %49)
  br label %when_end_17
when_end_17:
  br label %while_cond_14
while_end_16:
  br label %end_if_10
end_if_10:
  %50 = load i64**, i64*** %ptr_p
  %51 = call i1 @consume(i64** %50, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.187, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.188, i64 0, i64 0))
  %52 = load i64**, i64*** %ptr_p
  %53 = bitcast i64** %52 to i64*
  %54 = getelementptr inbounds i64, i64* %53, i64 1
  %55 = bitcast i64* %54 to i8**
  %56 = load i8*, i8** %55, align 8
  %57 = bitcast i8* %56 to i64*
  %58 = getelementptr inbounds i64, i64* %57, i64 0
  %59 = bitcast i64* %58 to i8**
  %60 = load i8*, i8** %59, align 8
  %61 = call i1 @check_token(i8* %60, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.189, i64 0, i64 0))
  br i1 %61, label %then_20, label %end_if_21
then_20:
  %62 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %62)
  %63 = load i64**, i64*** %ptr_p
  %64 = call i64** @parse_type(i64** %63)
  store i64** %64, i8* null
  br label %end_if_21
end_if_21:
  %65 = load i64**, i64*** %ptr_p
  %66 = call i64** @parse_block(i64** %65)
  %67 = icmp eq i64** %66, null
  br i1 %67, label %when_none_23, label %when_val_24
when_none_23:
  store i8* null, i8* null
  ret i8* null
unreachable_25:
  br label %when_end_22
when_val_24:
  store i64** %66, i64*** %ptr_body
  %68 = call i8* @malloc(i64 40)
  %69 = bitcast i8* %68 to i64*
  %70 = bitcast i64* %69 to i64*
  %71 = getelementptr inbounds i64, i64* %70, i64 0
  %72 = bitcast i64* %71 to i8**
  store i8* %5, i8** %72, align 8
  %73 = bitcast i64* %69 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 1
  %75 = bitcast i64* %74 to i64***
  store i64** %10, i64*** %75, align 8
  %76 = bitcast i64* %69 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 2
  %78 = bitcast i64* %77 to i64***
  store i64** %16, i64*** %78, align 8
  %79 = bitcast i64* %69 to i64*
  %80 = getelementptr inbounds i64, i64* %79, i64 3
  %81 = bitcast i64* %80 to i8**
  store i8* null, i8** %81, align 8
  %82 = load i64**, i64*** %ptr_body
  %83 = bitcast i64* %69 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 4
  %85 = bitcast i64* %84 to i64***
  store i64** %82, i64*** %85, align 8
  store i64* %69, i8* null
  ret i8* null
unreachable_26:
  br label %when_end_22
when_end_22:
  store i8* null, i8* null
  ret i8* null
unreachable_27:
  ret i64** null
}

define i64** @parse_field_decl(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i8* @consume_ident(i64** %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.190, i64 0, i64 0))
  %3 = call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.191, i64 0, i64 0))
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %5 = load i64**, i64*** %ptr_p
  %6 = call i1 @consume(i64** %5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.192, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.193, i64 0, i64 0))
  %7 = xor i1 %6, 1
  br i1 %7, label %then_3, label %end_if_4
then_3:
  store i8* null, i8* null
  ret i8* null
unreachable_5:
  br label %end_if_4
end_if_4:
  %8 = load i64**, i64*** %ptr_p
  %9 = call i64** @parse_type(i64** %8)
  %10 = icmp eq i64** %9, null
  br i1 %10, label %when_none_7, label %when_val_8
when_none_7:
  store i8* null, i8* null
  ret i8* null
unreachable_9:
  br label %when_end_6
when_val_8:
  %11 = call i8* @malloc(i64 16)
  %12 = bitcast i8* %11 to i64*
  store i64* %12, i64*** %ptr_field
  %13 = load i64**, i64*** %ptr_field
  %14 = bitcast i64** %13 to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 0
  %16 = bitcast i64* %15 to i8**
  store i8* %2, i8** %16, align 8
  %17 = load i64**, i64*** %ptr_field
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i64***
  store i64** %9, i64*** %20, align 8
  %21 = load i64**, i64*** %ptr_field
  store i64** %21, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_6
when_end_6:
  store i8* null, i8* null
  ret i8* null
unreachable_11:
  ret i64** null
}

define i64** @parse_data_decl(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.194, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.195, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %4 = load i64**, i64*** %ptr_p
  %5 = call i8* @consume_ident(i64** %4, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.196, i64 0, i64 0))
  %6 = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.197, i64 0, i64 0))
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %then_3, label %end_if_4
then_3:
  store i8* null, i8* null
  ret i8* null
unreachable_5:
  br label %end_if_4
end_if_4:
  %8 = call i8* @malloc(i64 8)
  %9 = bitcast i8* %8 to i64*
  %10 = call i64** @new_list_String(i64 0, i64* %9)
  %11 = load i64**, i64*** %ptr_p
  %12 = call i1 @consume(i64** %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.198, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.199, i64 0, i64 0))
  %13 = xor i1 %12, 1
  br i1 %13, label %then_6, label %end_if_7
then_6:
  store i8* null, i8* null
  ret i8* null
unreachable_8:
  br label %end_if_7
end_if_7:
  %14 = call i8* @malloc(i64 16)
  %15 = bitcast i8* %14 to i64*
  store i64* %15, i64*** %ptr_dummy_field
  %16 = load i64**, i64*** %ptr_dummy_field
  %17 = call i64** @new_list_FieldDecl(i64 4, i64** %16)
  store i64** %17, i64*** %ptr_fields
  br label %while_cond_9
while_cond_9:
  %18 = load i64**, i64*** %ptr_p
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 1
  %21 = bitcast i64* %20 to i8**
  %22 = load i8*, i8** %21, align 8
  %23 = bitcast i8* %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 0
  %25 = bitcast i64* %24 to i8**
  %26 = load i8*, i8** %25, align 8
  %27 = call i1 @check_token(i8* %26, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.200, i64 0, i64 0))
  %28 = xor i1 %27, 1
  %29 = load i64**, i64*** %ptr_p
  %30 = bitcast i64** %29 to i64*
  %31 = getelementptr inbounds i64, i64* %30, i64 1
  %32 = bitcast i64* %31 to i8**
  %33 = load i8*, i8** %32, align 8
  %34 = bitcast i8* %33 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 0
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8
  %38 = call i1 @check_token(i8* %37, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.201, i64 0, i64 0))
  %39 = xor i1 %38, 1
  %40 = and i1 %28, %39
  br i1 %40, label %while_body_10, label %while_end_11
while_body_10:
  %41 = load i64**, i64*** %ptr_p
  %42 = call i64** @parse_field_decl(i64** %41)
  %43 = icmp eq i64** %42, null
  br i1 %43, label %when_none_13, label %when_val_14
when_none_13:
  br label %when_end_12
when_val_14:
  store i64** %42, i64*** %ptr_field
  %44 = load i64**, i64*** %ptr_field
  %45 = load i64*, i64** %44
  %46 = load i64**, i64*** %ptr_fields
  call void @list_push_FieldDecl(i64** %46, i64* %45)
  br label %when_end_12
when_end_12:
  br label %while_cond_9
while_end_11:
  %47 = load i64**, i64*** %ptr_p
  %48 = call i1 @consume(i64** %47, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.202, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.203, i64 0, i64 0))
  %49 = call i8* @malloc(i64 24)
  %50 = bitcast i8* %49 to i64*
  %51 = bitcast i64* %50 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 0
  %53 = bitcast i64* %52 to i8**
  store i8* %5, i8** %53, align 8
  %54 = bitcast i64* %50 to i64*
  %55 = getelementptr inbounds i64, i64* %54, i64 1
  %56 = bitcast i64* %55 to i64***
  store i64** %10, i64*** %56, align 8
  %57 = load i64**, i64*** %ptr_fields
  %58 = bitcast i64* %50 to i64*
  %59 = getelementptr inbounds i64, i64* %58, i64 2
  %60 = bitcast i64* %59 to i64***
  store i64** %57, i64*** %60, align 8
  store i64* %50, i8* null
  ret i8* null
unreachable_15:
  ret i64** null
}

define i64** @parse_var_decl(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  store i1 0, i1* %ptr_is_mut
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = call i1 @check_token(i8* %9, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.204, i64 0, i64 0))
  br i1 %10, label %then_0, label %else_2
then_0:
  store i1 1, i1* %ptr_is_mut
  %11 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %11)
  br label %end_if_1
else_2:
  %12 = load i64**, i64*** %ptr_p
  %13 = call i1 @consume(i64** %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.205, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.206, i64 0, i64 0))
  %14 = xor i1 %13, 1
  br i1 %14, label %then_3, label %end_if_4
then_3:
  ret i8* null
unreachable_5:
  br label %end_if_4
end_if_4:
  br label %end_if_1
end_if_1:
  %15 = load i64**, i64*** %ptr_p
  %16 = call i8* @consume_ident(i64** %15, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.207, i64 0, i64 0))
  %17 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.208, i64 0, i64 0))
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %then_6, label %end_if_7
then_6:
  store i8* null, i8* null
  ret i8* null
unreachable_8:
  br label %end_if_7
end_if_7:
  %19 = load i64**, i64*** %ptr_p
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 1
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = bitcast i8* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = call i1 @check_token(i8* %27, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.209, i64 0, i64 0))
  br i1 %28, label %then_9, label %end_if_10
then_9:
  %29 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %29)
  %30 = load i64**, i64*** %ptr_p
  %31 = call i64** @parse_type(i64** %30)
  store i64** %31, i8* null
  br label %end_if_10
end_if_10:
  %32 = load i64**, i64*** %ptr_p
  %33 = call i1 @consume(i64** %32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.210, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.211, i64 0, i64 0))
  %34 = xor i1 %33, 1
  br i1 %34, label %then_11, label %end_if_12
then_11:
  store i8* null, i8* null
  ret i8* null
unreachable_13:
  br label %end_if_12
end_if_12:
  %35 = load i64**, i64*** %ptr_p
  %36 = call i64** @parse_expression(i64** %35)
  %37 = icmp eq i64** %36, null
  br i1 %37, label %when_none_15, label %when_val_16
when_none_15:
  store i8* null, i8* null
  ret i8* null
unreachable_17:
  br label %when_end_14
when_val_16:
  store i64** %36, i64*** %ptr_init
  %38 = call i8* @malloc(i64 32)
  %39 = bitcast i8* %38 to i64*
  %40 = load i1, i1* %ptr_is_mut
  %41 = bitcast i64* %39 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 0
  %43 = bitcast i64* %42 to i1*
  store i1 %40, i1* %43, align 8
  %44 = bitcast i64* %39 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 1
  %46 = bitcast i64* %45 to i8**
  store i8* %16, i8** %46, align 8
  %47 = bitcast i64* %39 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 2
  %49 = bitcast i64* %48 to i8**
  store i8* null, i8** %49, align 8
  %50 = load i64**, i64*** %ptr_init
  %51 = bitcast i64* %39 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 3
  %53 = bitcast i64* %52 to i64***
  store i64** %50, i64*** %53, align 8
  store i64* %39, i8* null
  ret i8* null
unreachable_18:
  br label %when_end_14
when_end_14:
  store i8* null, i8* null
  ret i8* null
unreachable_19:
  ret i64** null
}

define i64** @parse_choice_decl(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.212, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.213, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %4 = load i64**, i64*** %ptr_p
  %5 = call i8* @consume_ident(i64** %4, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.214, i64 0, i64 0))
  %6 = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.215, i64 0, i64 0))
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %then_3, label %end_if_4
then_3:
  store i8* null, i8* null
  ret i8* null
unreachable_5:
  br label %end_if_4
end_if_4:
  %8 = load i64**, i64*** %ptr_p
  %9 = call i64** @parse_generic_params(i64** %8)
  %10 = call i8* @malloc(i64 8)
  %11 = bitcast i8* %10 to i64*
  %12 = call i64** @new_list_String(i64 0, i64* %11)
  %13 = icmp eq i64** %9, null
  br i1 %13, label %when_none_7, label %when_val_8
when_none_7:
  br label %when_end_6
when_val_8:
  store i64** %9, i64*** %ptr_g
  %14 = load i64**, i64*** %ptr_g
  store i64** %14, i64** %12
  br label %when_end_6
when_end_6:
  %15 = load i64**, i64*** %ptr_p
  %16 = call i1 @consume(i64** %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.216, i64 0, i64 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.217, i64 0, i64 0))
  %17 = xor i1 %16, 1
  br i1 %17, label %then_9, label %end_if_10
then_9:
  store i8* null, i8* null
  ret i8* null
unreachable_11:
  br label %end_if_10
end_if_10:
  %18 = call i8* @malloc(i64 16)
  %19 = bitcast i8* %18 to i64*
  %20 = call i64** @new_list_VariantDecl(i64 4, i64* %19)
  store i64** %20, i64*** %ptr_variants
  br label %while_cond_12
while_cond_12:
  %21 = load i64**, i64*** %ptr_p
  %22 = bitcast i64** %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 1
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = bitcast i8* %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i8**
  %29 = load i8*, i8** %28, align 8
  %30 = call i1 @check_token(i8* %29, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.218, i64 0, i64 0))
  %31 = xor i1 %30, 1
  %32 = load i64**, i64*** %ptr_p
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i8**
  %36 = load i8*, i8** %35, align 8
  %37 = bitcast i8* %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 0
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  %41 = call i1 @check_token(i8* %40, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.219, i64 0, i64 0))
  %42 = xor i1 %41, 1
  %43 = and i1 %31, %42
  br i1 %43, label %while_body_13, label %while_end_14
while_body_13:
  %44 = load i64**, i64*** %ptr_p
  %45 = bitcast i64** %44 to i64*
  %46 = getelementptr inbounds i64, i64* %45, i64 1
  %47 = bitcast i64* %46 to i8**
  %48 = load i8*, i8** %47, align 8
  %49 = bitcast i8* %48 to i64*
  %50 = getelementptr inbounds i64, i64* %49, i64 0
  %51 = bitcast i64* %50 to i8**
  %52 = load i8*, i8** %51, align 8
  %53 = call i1 @check_token(i8* %52, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.220, i64 0, i64 0))
  br i1 %53, label %then_15, label %else_17
then_15:
  %54 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %54)
  br label %end_if_16
else_17:
  %55 = load i64**, i64*** %ptr_p
  %56 = call i8* @consume_ident(i64** %55, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.222, i64 0, i64 0))
  store i8* %56, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.221, i64 0, i64 0)
  br label %end_if_16
end_if_16:
  %57 = call i32 @strcmp(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.221, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.223, i64 0, i64 0))
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %then_18, label %end_if_19
then_18:
  store i8* null, i8* null
  ret i8* null
unreachable_20:
  br label %end_if_19
end_if_19:
  %59 = call i8* @malloc(i64 16)
  %60 = bitcast i8* %59 to i64*
  %61 = call i64** @new_list_Spanned_Type(i64 2, i64* %60)
  store i64** %61, i64*** %ptr_associated_types
  %62 = load i64**, i64*** %ptr_p
  %63 = bitcast i64** %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 1
  %65 = bitcast i64* %64 to i8**
  %66 = load i8*, i8** %65, align 8
  %67 = bitcast i8* %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = call i1 @check_token(i8* %70, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.224, i64 0, i64 0))
  br i1 %71, label %then_21, label %end_if_22
then_21:
  %72 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %72)
  %73 = load i64**, i64*** %ptr_p
  %74 = bitcast i64** %73 to i64*
  %75 = getelementptr inbounds i64, i64* %74, i64 1
  %76 = bitcast i64* %75 to i8**
  %77 = load i8*, i8** %76, align 8
  %78 = bitcast i8* %77 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 0
  %80 = bitcast i64* %79 to i8**
  %81 = load i8*, i8** %80, align 8
  %82 = call i1 @check_token(i8* %81, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.225, i64 0, i64 0))
  %83 = xor i1 %82, 1
  br i1 %83, label %then_23, label %end_if_24
then_23:
  %84 = load i64**, i64*** %ptr_p
  %85 = call i64** @parse_type(i64** %84)
  %86 = icmp eq i64** %85, null
  br i1 %86, label %when_none_26, label %when_val_27
when_none_26:
  br label %when_end_25
when_val_27:
  %87 = load i64*, i64** %85
  %88 = load i64**, i64*** %ptr_associated_types
  call void @list_push_Spanned_Type(i64** %88, i64* %87)
  br label %when_end_25
when_end_25:
  br label %while_cond_28
while_cond_28:
  %89 = load i64**, i64*** %ptr_p
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 1
  %92 = bitcast i64* %91 to i8**
  %93 = load i8*, i8** %92, align 8
  %94 = bitcast i8* %93 to i64*
  %95 = getelementptr inbounds i64, i64* %94, i64 0
  %96 = bitcast i64* %95 to i8**
  %97 = load i8*, i8** %96, align 8
  %98 = call i1 @check_token(i8* %97, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.226, i64 0, i64 0))
  br i1 %98, label %while_body_29, label %while_end_30
while_body_29:
  %99 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %99)
  %100 = load i64**, i64*** %ptr_p
  %101 = bitcast i64** %100 to i64*
  %102 = getelementptr inbounds i64, i64* %101, i64 1
  %103 = bitcast i64* %102 to i8**
  %104 = load i8*, i8** %103, align 8
  %105 = bitcast i8* %104 to i64*
  %106 = getelementptr inbounds i64, i64* %105, i64 0
  %107 = bitcast i64* %106 to i8**
  %108 = load i8*, i8** %107, align 8
  %109 = call i1 @check_token(i8* %108, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.227, i64 0, i64 0))
  %110 = xor i1 %109, 1
  br i1 %110, label %then_31, label %end_if_32
then_31:
  %111 = load i64**, i64*** %ptr_p
  %112 = call i64** @parse_type(i64** %111)
  %113 = icmp eq i64** %112, null
  br i1 %113, label %when_none_34, label %when_val_35
when_none_34:
  br label %when_end_33
when_val_35:
  store i64** %112, i64*** %ptr_t2
  %114 = load i64**, i64*** %ptr_t2
  %115 = load i64*, i64** %114
  %116 = load i64**, i64*** %ptr_associated_types
  call void @list_push_Spanned_Type(i64** %116, i64* %115)
  br label %when_end_33
when_end_33:
  br label %end_if_32
end_if_32:
  br label %while_cond_28
while_end_30:
  br label %end_if_24
end_if_24:
  %117 = load i64**, i64*** %ptr_p
  %118 = call i1 @consume(i64** %117, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.228, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.229, i64 0, i64 0))
  br label %end_if_22
end_if_22:
  %119 = call i8* @malloc(i64 16)
  %120 = bitcast i8* %119 to i64*
  store i64* %120, i64*** %ptr_vdecl
  %121 = load i64**, i64*** %ptr_vdecl
  %122 = bitcast i64** %121 to i64*
  %123 = getelementptr inbounds i64, i64* %122, i64 0
  %124 = bitcast i64* %123 to i8**
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.221, i64 0, i64 0), i8** %124, align 8
  %125 = load i64**, i64*** %ptr_vdecl
  %126 = load i64**, i64*** %ptr_associated_types
  %127 = bitcast i64** %125 to i64*
  %128 = getelementptr inbounds i64, i64* %127, i64 1
  %129 = bitcast i64* %128 to i64***
  store i64** %126, i64*** %129, align 8
  %130 = load i64**, i64*** %ptr_vdecl
  %131 = load i64*, i64** %130
  %132 = load i64**, i64*** %ptr_variants
  call void @list_push_VariantDecl(i64** %132, i64* %131)
  %133 = load i64**, i64*** %ptr_p
  %134 = bitcast i64** %133 to i64*
  %135 = getelementptr inbounds i64, i64* %134, i64 1
  %136 = bitcast i64* %135 to i8**
  %137 = load i8*, i8** %136, align 8
  %138 = bitcast i8* %137 to i64*
  %139 = getelementptr inbounds i64, i64* %138, i64 0
  %140 = bitcast i64* %139 to i8**
  %141 = load i8*, i8** %140, align 8
  %142 = call i1 @check_token(i8* %141, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.230, i64 0, i64 0))
  br i1 %142, label %then_36, label %end_if_37
then_36:
  %143 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %143)
  br label %end_if_37
end_if_37:
  br label %while_cond_12
while_end_14:
  %144 = load i64**, i64*** %ptr_p
  %145 = call i1 @consume(i64** %144, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.231, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.232, i64 0, i64 0))
  %146 = call i8* @malloc(i64 24)
  %147 = bitcast i8* %146 to i64*
  %148 = bitcast i64* %147 to i64*
  %149 = getelementptr inbounds i64, i64* %148, i64 0
  %150 = bitcast i64* %149 to i8**
  store i8* %5, i8** %150, align 8
  %151 = bitcast i64* %147 to i64*
  %152 = getelementptr inbounds i64, i64* %151, i64 1
  %153 = bitcast i64* %152 to i64***
  store i64** %12, i64*** %153, align 8
  %154 = load i64**, i64*** %ptr_variants
  %155 = bitcast i64* %147 to i64*
  %156 = getelementptr inbounds i64, i64* %155, i64 2
  %157 = bitcast i64* %156 to i64***
  store i64** %154, i64*** %157, align 8
  store i64* %147, i8* null
  ret i8* null
unreachable_38:
  ret i64** null
}

define i64** @parse_extern_decl(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.233, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.234, i64 0, i64 0))
  %3 = xor i1 %2, 1
  br i1 %3, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %4 = load i64**, i64*** %ptr_p
  %5 = call i1 @consume(i64** %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.235, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.236, i64 0, i64 0))
  %6 = xor i1 %5, 1
  br i1 %6, label %then_3, label %end_if_4
then_3:
  store i8* null, i8* null
  ret i8* null
unreachable_5:
  br label %end_if_4
end_if_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = call i8* @consume_ident(i64** %7, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.237, i64 0, i64 0))
  %9 = call i32 @strcmp(i8* %8, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.238, i64 0, i64 0))
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %then_6, label %end_if_7
then_6:
  store i8* null, i8* null
  ret i8* null
unreachable_8:
  br label %end_if_7
end_if_7:
  %11 = load i64**, i64*** %ptr_p
  %12 = call i64** @parse_generic_params(i64** %11)
  %13 = call i8* @malloc(i64 8)
  %14 = bitcast i8* %13 to i64*
  %15 = call i64** @new_list_String(i64 0, i64* %14)
  %16 = icmp eq i64** %12, null
  br i1 %16, label %when_none_10, label %when_val_11
when_none_10:
  br label %when_end_9
when_val_11:
  store i64** %12, i64*** %ptr_g
  %17 = load i64**, i64*** %ptr_g
  store i64** %17, i64** %15
  br label %when_end_9
when_end_9:
  %18 = load i64**, i64*** %ptr_p
  %19 = call i1 @consume(i64** %18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.239, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.240, i64 0, i64 0))
  %20 = xor i1 %19, 1
  br i1 %20, label %then_12, label %end_if_13
then_12:
  store i8* null, i8* null
  ret i8* null
unreachable_14:
  br label %end_if_13
end_if_13:
  %21 = call i8* @malloc(i64 24)
  %22 = bitcast i8* %21 to i64*
  %23 = call i64** @new_list_Param(i64 4, i64* %22)
  %24 = load i64**, i64*** %ptr_p
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 1
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to i64*
  %30 = getelementptr inbounds i64, i64* %29, i64 0
  %31 = bitcast i64* %30 to i8**
  %32 = load i8*, i8** %31, align 8
  %33 = call i1 @check_token(i8* %32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.241, i64 0, i64 0))
  %34 = xor i1 %33, 1
  br i1 %34, label %then_15, label %end_if_16
then_15:
  %35 = load i64**, i64*** %ptr_p
  %36 = call i64** @parse_param(i64** %35)
  %37 = load i64*, i64** %36
  %38 = icmp eq i64* %37, null
  br i1 %38, label %when_none_18, label %when_val_19
when_none_18:
  br label %when_end_17
when_val_19:
  %39 = load i64*, i64** %36
  %40 = load i64, i64* %39
  call void @list_push_Param(i64** %23, i64 %40)
  br label %when_end_17
when_end_17:
  br label %while_cond_20
while_cond_20:
  %41 = load i64**, i64*** %ptr_p
  %42 = bitcast i64** %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 1
  %44 = bitcast i64* %43 to i8**
  %45 = load i8*, i8** %44, align 8
  %46 = bitcast i8* %45 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 0
  %48 = bitcast i64* %47 to i8**
  %49 = load i8*, i8** %48, align 8
  %50 = call i1 @check_token(i8* %49, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.242, i64 0, i64 0))
  br i1 %50, label %while_body_21, label %while_end_22
while_body_21:
  %51 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %51)
  %52 = load i64**, i64*** %ptr_p
  %53 = call i64** @parse_param(i64** %52)
  %54 = icmp eq i64** %53, null
  br i1 %54, label %when_none_24, label %when_val_25
when_none_24:
  br label %when_end_23
when_val_25:
  store i64** %53, i64*** %ptr_pr
  %55 = load i64**, i64*** %ptr_pr
  %56 = load i64*, i64** %55
  call void @list_push_Param(i64** %23, i64* %56)
  br label %when_end_23
when_end_23:
  br label %while_cond_20
while_end_22:
  br label %end_if_16
end_if_16:
  %57 = load i64**, i64*** %ptr_p
  %58 = call i1 @consume(i64** %57, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.243, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.244, i64 0, i64 0))
  %59 = load i64**, i64*** %ptr_p
  %60 = bitcast i64** %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 1
  %62 = bitcast i64* %61 to i8**
  %63 = load i8*, i8** %62, align 8
  %64 = bitcast i8* %63 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  %66 = bitcast i64* %65 to i8**
  %67 = load i8*, i8** %66, align 8
  %68 = call i1 @check_token(i8* %67, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.245, i64 0, i64 0))
  br i1 %68, label %then_26, label %end_if_27
then_26:
  %69 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %69)
  %70 = load i64**, i64*** %ptr_p
  %71 = call i64** @parse_type(i64** %70)
  store i64** %71, i8* null
  br label %end_if_27
end_if_27:
  %72 = call i8* @malloc(i64 32)
  %73 = bitcast i8* %72 to i64*
  %74 = bitcast i64* %73 to i64*
  %75 = getelementptr inbounds i64, i64* %74, i64 0
  %76 = bitcast i64* %75 to i8**
  store i8* %8, i8** %76, align 8
  %77 = bitcast i64* %73 to i64*
  %78 = getelementptr inbounds i64, i64* %77, i64 1
  %79 = bitcast i64* %78 to i64***
  store i64** %15, i64*** %79, align 8
  %80 = bitcast i64* %73 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 2
  %82 = bitcast i64* %81 to i64***
  store i64** %23, i64*** %82, align 8
  %83 = bitcast i64* %73 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 3
  %85 = bitcast i64* %84 to i8**
  store i8* null, i8** %85, align 8
  store i64* %73, i8* null
  ret i8* null
unreachable_28:
  ret i64** null
}

define i64** @parse_declaration(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64**, i64*** %ptr_p
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = load i64**, i64*** %ptr_p
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 1
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = bitcast i8* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = call i1 @check_token(i8* %27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.246, i64 0, i64 0))
  br i1 %28, label %then_0, label %end_if_1
then_0:
  %29 = load i64**, i64*** %ptr_p
  %30 = call i64** @parse_data_decl(i64** %29)
  store i64** %30, i64*** %ptr_data_opt
  %31 = load i64**, i64*** %ptr_data_opt
  %32 = icmp eq i64** %31, null
  br i1 %32, label %when_none_3, label %when_val_4
when_none_3:
  br label %when_end_2
when_val_4:
  %33 = load i64**, i64*** %ptr_data_opt
  store i64** %33, i64*** %ptr_d
  %34 = call i8* @malloc(i64 16)
  %35 = bitcast i8* %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 0
  store i64 0, i64* %36
  %37 = load i64**, i64*** %ptr_d
  %38 = getelementptr inbounds i64, i64* %35, i64 1
  %39 = bitcast i64* %38 to i64***
  store i64** %37, i64*** %39
  store i64* %35, i8* null
  br label %when_end_2
when_end_2:
  br label %end_if_1
end_if_1:
  %40 = load i64**, i64*** %ptr_p
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 1
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = bitcast i8* %44 to i64*
  %46 = getelementptr inbounds i64, i64* %45, i64 0
  %47 = bitcast i64* %46 to i8**
  %48 = load i8*, i8** %47, align 8
  %49 = call i1 @check_token(i8* %48, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.247, i64 0, i64 0))
  br i1 %49, label %then_5, label %end_if_6
then_5:
  %50 = load i64**, i64*** %ptr_p
  %51 = call i64** @parse_choice_decl(i64** %50)
  %52 = icmp eq i64** %51, null
  br i1 %52, label %when_none_8, label %when_val_9
when_none_8:
  br label %when_end_7
when_val_9:
  store i64** %51, i64*** %ptr_c
  %53 = call i8* @malloc(i64 16)
  %54 = bitcast i8* %53 to i64*
  %55 = getelementptr inbounds i64, i64* %54, i64 0
  store i64 15, i64* %55
  %56 = load i64**, i64*** %ptr_c
  %57 = getelementptr inbounds i64, i64* %54, i64 1
  %58 = bitcast i64* %57 to i64***
  store i64** %56, i64*** %58
  store i64* %54, i8* null
  br label %when_end_7
when_end_7:
  br label %end_if_6
end_if_6:
  %59 = load i64**, i64*** %ptr_p
  %60 = bitcast i64** %59 to i64*
  %61 = getelementptr inbounds i64, i64* %60, i64 1
  %62 = bitcast i64* %61 to i8**
  %63 = load i8*, i8** %62, align 8
  %64 = bitcast i8* %63 to i64*
  %65 = getelementptr inbounds i64, i64* %64, i64 0
  %66 = bitcast i64* %65 to i8**
  %67 = load i8*, i8** %66, align 8
  %68 = call i1 @check_token(i8* %67, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.248, i64 0, i64 0))
  br i1 %68, label %then_10, label %end_if_11
then_10:
  %69 = load i64**, i64*** %ptr_p
  %70 = call i64** @parse_fn_decl(i64** %69)
  %71 = icmp eq i64** %70, null
  br i1 %71, label %when_none_13, label %when_val_14
when_none_13:
  br label %when_end_12
when_val_14:
  store i64** %70, i64*** %ptr_f
  %72 = call i8* @malloc(i64 16)
  %73 = bitcast i8* %72 to i64*
  %74 = getelementptr inbounds i64, i64* %73, i64 0
  store i64 1, i64* %74
  %75 = load i64**, i64*** %ptr_f
  %76 = getelementptr inbounds i64, i64* %73, i64 1
  %77 = bitcast i64* %76 to i64***
  store i64** %75, i64*** %77
  store i64* %73, i8* null
  br label %when_end_12
when_end_12:
  br label %end_if_11
end_if_11:
  %78 = load i64**, i64*** %ptr_p
  %79 = bitcast i64** %78 to i64*
  %80 = getelementptr inbounds i64, i64* %79, i64 1
  %81 = bitcast i64* %80 to i8**
  %82 = load i8*, i8** %81, align 8
  %83 = bitcast i8* %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 0
  %85 = bitcast i64* %84 to i8**
  %86 = load i8*, i8** %85, align 8
  %87 = call i1 @check_token(i8* %86, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.249, i64 0, i64 0))
  br i1 %87, label %then_15, label %end_if_16
then_15:
  %88 = load i64**, i64*** %ptr_p
  %89 = call i64** @parse_extern_decl(i64** %88)
  %90 = icmp eq i64** %89, null
  br i1 %90, label %when_none_18, label %when_val_19
when_none_18:
  br label %when_end_17
when_val_19:
  store i64** %89, i64*** %ptr_e
  %91 = call i8* @malloc(i64 16)
  %92 = bitcast i8* %91 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 0
  store i64 12, i64* %93
  %94 = load i64**, i64*** %ptr_e
  %95 = getelementptr inbounds i64, i64* %92, i64 1
  %96 = bitcast i64* %95 to i64***
  store i64** %94, i64*** %96
  store i64* %92, i8* null
  br label %when_end_17
when_end_17:
  br label %end_if_16
end_if_16:
  %97 = load i64**, i64*** %ptr_p
  %98 = bitcast i64** %97 to i64*
  %99 = getelementptr inbounds i64, i64* %98, i64 1
  %100 = bitcast i64* %99 to i8**
  %101 = load i8*, i8** %100, align 8
  %102 = bitcast i8* %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 0
  %104 = bitcast i64* %103 to i8**
  %105 = load i8*, i8** %104, align 8
  %106 = call i1 @check_token(i8* %105, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.250, i64 0, i64 0))
  %107 = load i64**, i64*** %ptr_p
  %108 = bitcast i64** %107 to i64*
  %109 = getelementptr inbounds i64, i64* %108, i64 1
  %110 = bitcast i64* %109 to i8**
  %111 = load i8*, i8** %110, align 8
  %112 = bitcast i8* %111 to i64*
  %113 = getelementptr inbounds i64, i64* %112, i64 0
  %114 = bitcast i64* %113 to i8**
  %115 = load i8*, i8** %114, align 8
  %116 = call i1 @check_token(i8* %115, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.251, i64 0, i64 0))
  %117 = or i1 %106, %116
  br i1 %117, label %then_20, label %end_if_21
then_20:
  %118 = load i64**, i64*** %ptr_p
  %119 = call i64** @parse_var_decl(i64** %118)
  %120 = icmp eq i64** %119, null
  br i1 %120, label %when_none_23, label %when_val_24
when_none_23:
  br label %when_end_22
when_val_24:
  store i64** %119, i64*** %ptr_v
  %121 = call i8* @malloc(i64 16)
  %122 = bitcast i8* %121 to i64*
  %123 = getelementptr inbounds i64, i64* %122, i64 0
  store i64 4, i64* %123
  %124 = load i64**, i64*** %ptr_v
  %125 = getelementptr inbounds i64, i64* %122, i64 1
  %126 = bitcast i64* %125 to i64***
  store i64** %124, i64*** %126
  store i64* %122, i8* null
  br label %when_end_22
when_end_22:
  br label %end_if_21
end_if_21:
  %127 = icmp eq i8* null, null
  br i1 %127, label %when_none_26, label %when_val_27
when_none_26:
  ret i8* null
unreachable_28:
  br label %when_end_25
when_val_27:
  %128 = load i64**, i64*** %ptr_p
  %129 = bitcast i64** %128 to i64*
  %130 = getelementptr inbounds i64, i64* %129, i64 1
  %131 = bitcast i64* %130 to i8**
  %132 = load i8*, i8** %131, align 8
  %133 = bitcast i8* %132 to i64*
  %134 = getelementptr inbounds i64, i64* %133, i64 1
  %135 = bitcast i64* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = load i64**, i64*** %ptr_p
  %138 = bitcast i64** %137 to i64*
  %139 = getelementptr inbounds i64, i64* %138, i64 1
  %140 = bitcast i64* %139 to i8**
  %141 = load i8*, i8** %140, align 8
  %142 = bitcast i8* %141 to i64*
  %143 = getelementptr inbounds i64, i64* %142, i64 2
  %144 = bitcast i64* %143 to i64*
  %145 = load i64, i64* %144, align 8
  %146 = call i64** @alloc_span(i64 %9, i64 %18, i64 %136, i64 %145)
  store i64** %146, i64*** %ptr_span
  %147 = call i64 @alloc_spanned(i64 %Declaration)
  %148 = load i64**, i64*** %ptr_span
  %149 = call i64 @unknown(i8* null, i64** %148)
  store i64 %149, i8* null
  ret i8* null
unreachable_29:
  br label %when_end_25
when_end_25:
  store i8* null, i8* null
  ret i8* null
unreachable_30:
  ret i64** null
}

define i64** @parse_import_directive(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64**, i64*** %ptr_p
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = load i64**, i64*** %ptr_p
  %20 = call i1 @consume(i64** %19, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.252, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.253, i64 0, i64 0))
  %21 = xor i1 %20, 1
  br i1 %21, label %then_0, label %end_if_1
then_0:
  ret i8* null
unreachable_2:
  br label %end_if_1
end_if_1:
  %22 = call i8* @malloc(i64 8)
  %23 = bitcast i8* %22 to i64*
  %24 = call i64** @new_list_String(i64 2, i64* %23)
  store i64** %24, i64*** %ptr_path
  %25 = load i64**, i64*** %ptr_p
  %26 = call i8* @consume_ident(i64** %25, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.254, i64 0, i64 0))
  store i8* %26, i8** %ptr_first_name
  %27 = load i8*, i8** %ptr_first_name
  %28 = call i32 @strcmp(i8* %27, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.255, i64 0, i64 0))
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %then_3, label %end_if_4
then_3:
  store i8* null, i8* null
  ret i8* null
unreachable_5:
  br label %end_if_4
end_if_4:
  %30 = load i64**, i64*** %ptr_path
  %31 = load i8*, i8** %ptr_first_name
  call void @list_push_String(i64** %30, i8* %31)
  %32 = load i64**, i64*** %ptr_p
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i8**
  %36 = load i8*, i8** %35, align 8
  %37 = bitcast i8* %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 1
  %39 = bitcast i64* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = load i64**, i64*** %ptr_p
  %42 = bitcast i64** %41 to i64*
  %43 = getelementptr inbounds i64, i64* %42, i64 1
  %44 = bitcast i64* %43 to i8**
  %45 = load i8*, i8** %44, align 8
  %46 = bitcast i8* %45 to i64*
  %47 = getelementptr inbounds i64, i64* %46, i64 2
  %48 = bitcast i64* %47 to i64*
  %49 = load i64, i64* %48, align 8
  br label %while_cond_6
while_cond_6:
  %50 = load i64**, i64*** %ptr_p
  %51 = bitcast i64** %50 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 1
  %53 = bitcast i64* %52 to i8**
  %54 = load i8*, i8** %53, align 8
  %55 = bitcast i8* %54 to i64*
  %56 = getelementptr inbounds i64, i64* %55, i64 0
  %57 = bitcast i64* %56 to i8**
  %58 = load i8*, i8** %57, align 8
  %59 = call i1 @check_token(i8* %58, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.256, i64 0, i64 0))
  br i1 %59, label %while_body_7, label %while_end_8
while_body_7:
  %60 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %60)
  %61 = load i64**, i64*** %ptr_p
  %62 = call i8* @consume_ident(i64** %61, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.257, i64 0, i64 0))
  %63 = call i32 @strcmp(i8* %62, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.258, i64 0, i64 0))
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %then_9, label %end_if_10
then_9:
  store i8* null, i8* null
  ret i8* null
unreachable_11:
  br label %end_if_10
end_if_10:
  %65 = load i64**, i64*** %ptr_path
  call void @list_push_String(i64** %65, i8* %62)
  %66 = load i64**, i64*** %ptr_p
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 1
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = bitcast i8* %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 1
  %73 = bitcast i64* %72 to i64*
  %74 = load i64, i64* %73, align 8
  store i64 %74, i64 %40
  %75 = load i64**, i64*** %ptr_p
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i8**
  %79 = load i8*, i8** %78, align 8
  %80 = bitcast i8* %79 to i64*
  %81 = getelementptr inbounds i64, i64* %80, i64 2
  %82 = bitcast i64* %81 to i64*
  %83 = load i64, i64* %82, align 8
  store i64 %83, i64 %49
  br label %while_cond_6
while_end_8:
  %84 = call i64** @alloc_span(i64 %9, i64 %18, i64 %40, i64 %49)
  store i64** %84, i64*** %ptr_span
  %85 = call i8* @malloc(i64 8)
  %86 = bitcast i8* %85 to i64*
  %87 = load i64**, i64*** %ptr_path
  %88 = bitcast i64* %86 to i64*
  %89 = getelementptr inbounds i64, i64* %88, i64 0
  %90 = bitcast i64* %89 to i64***
  store i64** %87, i64*** %90, align 8
  %91 = call i64 @alloc_spanned(i64 %ImportDirective)
  %92 = load i64, i64* %86
  %93 = load i64**, i64*** %ptr_span
  %94 = call i64 @unknown(i64 %92, i64** %93)
  store i64 %94, i8* null
  ret i8* null
unreachable_12:
  ret i64** null
}

define i64** @parse_program(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = call i8* @malloc(i64 16)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_prog
  %3 = call i8* @malloc(i64 16)
  %4 = bitcast i8* %3 to i64*
  store i64* %4, i64*** %ptr_dummy_import
  %5 = load i64**, i64*** %ptr_dummy_import
  %6 = call i64** @new_list_Spanned_ImportDirective(i64 0, i64** %5)
  %7 = load i64**, i64*** %ptr_dummy_import
  %8 = call i64** @new_list_Spanned_ImportDirective(i64 0, i64** %7)
  %9 = load i64**, i64*** %ptr_prog
  %10 = bitcast i64** %9 to i64*
  %11 = getelementptr inbounds i64, i64* %10, i64 0
  %12 = bitcast i64* %11 to i64***
  store i64** %8, i64*** %12, align 8
  %13 = call i8* @malloc(i64 16)
  %14 = bitcast i8* %13 to i64*
  %15 = call i64** @new_list_Spanned_Declaration(i64 10, i64* %14)
  %16 = call i64** @new_list_Spanned_Declaration(i64 10, i64* %14)
  %17 = load i64**, i64*** %ptr_prog
  %18 = bitcast i64** %17 to i64*
  %19 = getelementptr inbounds i64, i64* %18, i64 1
  %20 = bitcast i64* %19 to i64***
  store i64** %16, i64*** %20, align 8
  br label %while_cond_0
while_cond_0:
  %21 = load i64**, i64*** %ptr_p
  %22 = bitcast i64** %21 to i64*
  %23 = getelementptr inbounds i64, i64* %22, i64 1
  %24 = bitcast i64* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = bitcast i8* %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i8**
  %29 = load i8*, i8** %28, align 8
  %30 = call i1 @check_token(i8* %29, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.259, i64 0, i64 0))
  br i1 %30, label %while_body_1, label %while_end_2
while_body_1:
  %31 = load i64**, i64*** %ptr_p
  %32 = call i64** @parse_import_directive(i64** %31)
  %33 = icmp eq i64** %32, null
  br i1 %33, label %when_none_4, label %when_val_5
when_none_4:
  %34 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %34)
  br label %when_end_3
when_val_5:
  store i64** %32, i64*** %ptr_imp
  %35 = load i64**, i64*** %ptr_prog
  %36 = bitcast i64** %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 0
  %38 = bitcast i64* %37 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = load i64**, i64*** %ptr_imp
  %41 = load i64*, i64** %40
  call void @list_push_Spanned_ImportDirective(i8* %39, i64* %41)
  br label %when_end_3
when_end_3:
  br label %while_cond_0
while_end_2:
  br label %while_cond_6
while_cond_6:
  %42 = load i64**, i64*** %ptr_p
  %43 = bitcast i64** %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 1
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 0
  %49 = bitcast i64* %48 to i8**
  %50 = load i8*, i8** %49, align 8
  %51 = call i1 @check_token(i8* %50, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.260, i64 0, i64 0))
  %52 = xor i1 %51, 1
  br i1 %52, label %while_body_7, label %while_end_8
while_body_7:
  %53 = load i64**, i64*** %ptr_p
  %54 = call i64** @parse_declaration(i64** %53)
  %55 = icmp eq i64** %54, null
  br i1 %55, label %when_none_10, label %when_val_11
when_none_10:
  %56 = load i64**, i64*** %ptr_p
  %57 = bitcast i64** %56 to i64*
  %58 = getelementptr inbounds i64, i64* %57, i64 1
  %59 = bitcast i64* %58 to i8**
  %60 = load i8*, i8** %59, align 8
  %61 = bitcast i8* %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 0
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = call i1 @check_token(i8* %64, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.261, i64 0, i64 0))
  %66 = xor i1 %65, 1
  br i1 %66, label %then_12, label %end_if_13
then_12:
  %67 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %67)
  br label %end_if_13
end_if_13:
  br label %when_end_9
when_val_11:
  %68 = load i64**, i64*** %ptr_prog
  %69 = bitcast i64** %68 to i64*
  %70 = getelementptr inbounds i64, i64* %69, i64 1
  %71 = bitcast i64* %70 to i8**
  %72 = load i8*, i8** %71, align 8
  %73 = load i64*, i64** %54
  call void @list_push_Spanned_Declaration(i8* %72, i64* %73)
  br label %when_end_9
when_end_9:
  br label %while_cond_6
while_end_8:
  %74 = load i64**, i64*** %ptr_prog
  ret i64** %74
unreachable_14:
  ret i64** null
}

define i64** @parse_unary_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = call i1 @check_token(i8* %9, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.262, i64 0, i64 0))
  %11 = load i64**, i64*** %ptr_p
  %12 = bitcast i64** %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 1
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = bitcast i8* %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 0
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = call i1 @check_token(i8* %19, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.263, i64 0, i64 0))
  %21 = or i1 %10, %20
  br i1 %21, label %then_0, label %end_if_1
then_0:
  %22 = load i64**, i64*** %ptr_p
  %23 = bitcast i64** %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 1
  %25 = bitcast i64* %24 to i8**
  %26 = load i8*, i8** %25, align 8
  %27 = bitcast i8* %26 to i64*
  %28 = getelementptr inbounds i64, i64* %27, i64 1
  %29 = bitcast i64* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = load i64**, i64*** %ptr_p
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 2
  %38 = bitcast i64* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = call i8* @malloc(i64 8)
  %41 = bitcast i8* %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 0
  store i64 0, i64* %42
  %43 = load i64**, i64*** %ptr_p
  %44 = bitcast i64** %43 to i64*
  %45 = getelementptr inbounds i64, i64* %44, i64 1
  %46 = bitcast i64* %45 to i8**
  %47 = load i8*, i8** %46, align 8
  %48 = bitcast i8* %47 to i64*
  %49 = getelementptr inbounds i64, i64* %48, i64 0
  %50 = bitcast i64* %49 to i8**
  %51 = load i8*, i8** %50, align 8
  %52 = call i1 @check_token(i8* %51, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.264, i64 0, i64 0))
  br i1 %52, label %then_2, label %end_if_3
then_2:
  %53 = call i8* @malloc(i64 8)
  %54 = bitcast i8* %53 to i64*
  %55 = getelementptr inbounds i64, i64* %54, i64 0
  store i64 18, i64* %55
  store i64* %54, i64* %41
  br label %end_if_3
end_if_3:
  %56 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %56)
  %57 = load i64**, i64*** %ptr_p
  %58 = call i64** @parse_unary_expr(i64** %57)
  %59 = icmp eq i64** %58, null
  br i1 %59, label %when_none_5, label %when_val_6
when_none_5:
  ret i8* null
unreachable_7:
  br label %when_end_4
when_val_6:
  store i64** %58, i64*** %ptr_operand
  %60 = load i64**, i64*** %ptr_operand
  %61 = bitcast i64** %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 1
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = bitcast i8* %64 to i64*
  %66 = getelementptr inbounds i64, i64* %65, i64 2
  %67 = bitcast i64* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = load i64**, i64*** %ptr_operand
  %70 = bitcast i64** %69 to i64*
  %71 = getelementptr inbounds i64, i64* %70, i64 1
  %72 = bitcast i64* %71 to i8**
  %73 = load i8*, i8** %72, align 8
  %74 = bitcast i8* %73 to i64*
  %75 = getelementptr inbounds i64, i64* %74, i64 3
  %76 = bitcast i64* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = call i64** @alloc_span(i64 %30, i64 %39, i64 %68, i64 %77)
  store i64** %78, i64*** %ptr_span
  %79 = call i8* @malloc(i64 16)
  %80 = bitcast i8* %79 to i64*
  %81 = bitcast i64* %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 0
  %83 = bitcast i64* %82 to i64**
  store i64* %41, i64** %83, align 8
  %84 = load i64**, i64*** %ptr_operand
  %85 = bitcast i64* %80 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 1
  %87 = bitcast i64* %86 to i64***
  store i64** %84, i64*** %87, align 8
  %88 = call i8* @malloc(i64 16)
  %89 = bitcast i8* %88 to i64*
  store i64* %89, i64*** %ptr_expr
  %90 = load i64**, i64*** %ptr_expr
  %91 = load i64**, i64*** %ptr_span
  %92 = bitcast i64** %90 to i64*
  %93 = getelementptr inbounds i64, i64* %92, i64 1
  %94 = bitcast i64* %93 to i64***
  store i64** %91, i64*** %94, align 8
  %95 = call i8* @malloc(i64 16)
  %96 = bitcast i8* %95 to i64*
  %97 = load i64, i64* %80
  store i64 %97, i64* %96
  %98 = call i8* @malloc(i64 16)
  %99 = bitcast i8* %98 to i64*
  %100 = getelementptr inbounds i64, i64* %99, i64 0
  store i64 0, i64* %100
  %101 = getelementptr inbounds i64, i64* %99, i64 1
  %102 = bitcast i64* %101 to i64**
  store i64* %96, i64** %102
  %103 = load i64**, i64*** %ptr_expr
  %104 = bitcast i64** %103 to i64*
  %105 = getelementptr inbounds i64, i64* %104, i64 0
  %106 = bitcast i64* %105 to i64**
  store i64* %99, i64** %106, align 8
  %107 = load i64**, i64*** %ptr_expr
  store i64** %107, i8* null
  ret i8* null
unreachable_8:
  br label %when_end_4
when_end_4:
  br label %end_if_1
end_if_1:
  %108 = load i64**, i64*** %ptr_p
  %109 = call i64** @parse_cast_expr(i64** %108)
  ret i64** %109
unreachable_9:
  ret i64** null
}

define i64** @parse_cast_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_postfix_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  br label %while_cond_4
while_cond_4:
  %7 = load i64**, i64*** %ptr_p
  %8 = bitcast i64** %7 to i64*
  %9 = getelementptr inbounds i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = call i1 @check_token(i8* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.265, i64 0, i64 0))
  br i1 %16, label %while_body_5, label %while_end_6
while_body_5:
  %17 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %17)
  %18 = load i64**, i64*** %ptr_p
  %19 = call i64** @parse_type(i64** %18)
  store i64** %19, i64*** %ptr_target_opt
  %20 = load i64**, i64*** %ptr_target_opt
  %21 = icmp eq i64** %20, null
  br i1 %21, label %when_none_8, label %when_val_9
when_none_8:
  %22 = load i64**, i64*** %ptr_p
  %23 = bitcast i64** %22 to i64*
  %24 = getelementptr inbounds i64, i64* %23, i64 1
  %25 = bitcast i64* %24 to i8**
  %26 = load i8*, i8** %25, align 8
  %27 = bitcast i8* %26 to i64*
  %28 = getelementptr inbounds i64, i64* %27, i64 1
  %29 = bitcast i64* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = load i64**, i64*** %ptr_p
  %32 = bitcast i64** %31 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8**
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr inbounds i64, i64* %36, i64 2
  %38 = bitcast i64* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = load i64**, i64*** %ptr_p
  %41 = bitcast i64** %40 to i64*
  %42 = getelementptr inbounds i64, i64* %41, i64 1
  %43 = bitcast i64* %42 to i8**
  %44 = load i8*, i8** %43, align 8
  %45 = bitcast i8* %44 to i64*
  %46 = getelementptr inbounds i64, i64* %45, i64 1
  %47 = bitcast i64* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = load i64**, i64*** %ptr_p
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 1
  %52 = bitcast i64* %51 to i8**
  %53 = load i8*, i8** %52, align 8
  %54 = bitcast i8* %53 to i64*
  %55 = getelementptr inbounds i64, i64* %54, i64 2
  %56 = bitcast i64* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = call i64** @alloc_span(i64 %30, i64 %39, i64 %48, i64 %57)
  store i64** %58, i64*** %ptr_span
  %59 = load i64**, i64*** %ptr_p
  %60 = load i64**, i64*** %ptr_span
  call void @report_error(i64** %59, i64** %60, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.266, i64 0, i64 0))
  store i8* null, i8* null
  ret i8* null
unreachable_10:
  br label %when_end_7
when_val_9:
  %61 = load i64**, i64*** %ptr_target_opt
  store i64** %61, i64*** %ptr_target_type
  %62 = load i64**, i64*** %ptr_left
  %63 = bitcast i64** %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 1
  %65 = bitcast i64* %64 to i8**
  %66 = load i8*, i8** %65, align 8
  %67 = bitcast i8* %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = load i64**, i64*** %ptr_left
  %72 = bitcast i64** %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 1
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = bitcast i8* %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64**, i64*** %ptr_target_type
  %81 = bitcast i64** %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 1
  %83 = bitcast i64* %82 to i8**
  %84 = load i8*, i8** %83, align 8
  %85 = bitcast i8* %84 to i64*
  %86 = getelementptr inbounds i64, i64* %85, i64 2
  %87 = bitcast i64* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = load i64**, i64*** %ptr_target_type
  %90 = bitcast i64** %89 to i64*
  %91 = getelementptr inbounds i64, i64* %90, i64 1
  %92 = bitcast i64* %91 to i8**
  %93 = load i8*, i8** %92, align 8
  %94 = bitcast i8* %93 to i64*
  %95 = getelementptr inbounds i64, i64* %94, i64 3
  %96 = bitcast i64* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = call i64** @alloc_span(i64 %70, i64 %79, i64 %88, i64 %97)
  store i64** %98, i64*** %ptr_span
  %99 = call i8* @malloc(i64 16)
  %100 = bitcast i8* %99 to i64*
  store i64* %100, i64*** %ptr_c_expr
  %101 = load i64**, i64*** %ptr_c_expr
  %102 = load i64**, i64*** %ptr_left
  %103 = bitcast i64** %101 to i64*
  %104 = getelementptr inbounds i64, i64* %103, i64 0
  %105 = bitcast i64* %104 to i64***
  store i64** %102, i64*** %105, align 8
  %106 = load i64**, i64*** %ptr_c_expr
  %107 = load i64**, i64*** %ptr_target_type
  %108 = bitcast i64** %106 to i64*
  %109 = getelementptr inbounds i64, i64* %108, i64 1
  %110 = bitcast i64* %109 to i64***
  store i64** %107, i64*** %110, align 8
  %111 = call i8* @malloc(i64 16)
  %112 = bitcast i8* %111 to i64*
  store i64* %112, i64*** %ptr_expr
  %113 = load i64**, i64*** %ptr_expr
  %114 = load i64**, i64*** %ptr_span
  %115 = bitcast i64** %113 to i64*
  %116 = getelementptr inbounds i64, i64* %115, i64 1
  %117 = bitcast i64* %116 to i64***
  store i64** %114, i64*** %117, align 8
  %118 = call i8* @malloc(i64 16)
  %119 = bitcast i8* %118 to i64*
  %120 = load i64**, i64*** %ptr_c_expr
  %121 = load i64*, i64** %120
  store i64* %121, i64* %119
  %122 = call i8* @malloc(i64 16)
  %123 = bitcast i8* %122 to i64*
  %124 = getelementptr inbounds i64, i64* %123, i64 0
  store i64 15, i64* %124
  %125 = getelementptr inbounds i64, i64* %123, i64 1
  %126 = bitcast i64* %125 to i64**
  store i64* %119, i64** %126
  %127 = load i64**, i64*** %ptr_expr
  %128 = bitcast i64** %127 to i64*
  %129 = getelementptr inbounds i64, i64* %128, i64 0
  %130 = bitcast i64* %129 to i64**
  store i64* %123, i64** %130, align 8
  %131 = load i64**, i64*** %ptr_expr
  store i64** %131, i64*** %ptr_left
  br label %when_end_7
when_end_7:
  br label %while_cond_4
while_end_6:
  %132 = load i64**, i64*** %ptr_left
  store i64** %132, i8* null
  ret i8* null
unreachable_11:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_postfix_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i64** @parse_primary_expr(i64** %1)
  store i64** %2, i64*** %ptr_left_opt
  %3 = load i64**, i64*** %ptr_left_opt
  %4 = icmp eq i64** %3, null
  br i1 %4, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %5 = load i64**, i64*** %ptr_left_opt
  store i64** %5, i64*** %ptr_l
  %6 = load i64**, i64*** %ptr_l
  store i64** %6, i64*** %ptr_left
  store i1 1, i1* %ptr_parsing
  br label %while_cond_4
while_cond_4:
  %7 = load i1, i1* %ptr_parsing
  br i1 %7, label %while_body_5, label %while_end_6
while_body_5:
  %8 = load i64**, i64*** %ptr_p
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i8**
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i8**
  %16 = load i8*, i8** %15, align 8
  %17 = call i1 @check_token(i8* %16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.267, i64 0, i64 0))
  br i1 %17, label %then_7, label %else_9
then_7:
  %18 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %18)
  %19 = load i64**, i64*** %ptr_p
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 1
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = bitcast i8* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = call i1 @check_token(i8* %27, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.268, i64 0, i64 0))
  br i1 %28, label %then_10, label %else_12
then_10:
  %29 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %29)
  br label %end_if_11
else_12:
  %30 = load i64**, i64*** %ptr_p
  %31 = call i8* @consume_ident(i64** %30, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.270, i64 0, i64 0))
  store i8* %31, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.269, i64 0, i64 0)
  %32 = call i32 @strcmp(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.269, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.271, i64 0, i64 0))
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %then_13, label %end_if_14
then_13:
  store i8* null, i8* null
  ret i8* null
unreachable_15:
  br label %end_if_14
end_if_14:
  br label %end_if_11
end_if_11:
  %34 = load i64**, i64*** %ptr_p
  %35 = bitcast i64** %34 to i64*
  %36 = getelementptr inbounds i64, i64* %35, i64 1
  %37 = bitcast i64* %36 to i8**
  %38 = load i8*, i8** %37, align 8
  %39 = bitcast i8* %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 0
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = call i1 @check_token(i8* %42, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.272, i64 0, i64 0))
  br i1 %43, label %then_16, label %else_18
then_16:
  %44 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %44)
  %45 = call i64** @new_empty_expr_list()
  %46 = load i64**, i64*** %ptr_p
  %47 = bitcast i64** %46 to i64*
  %48 = getelementptr inbounds i64, i64* %47, i64 1
  %49 = bitcast i64* %48 to i8**
  %50 = load i8*, i8** %49, align 8
  %51 = bitcast i8* %50 to i64*
  %52 = getelementptr inbounds i64, i64* %51, i64 0
  %53 = bitcast i64* %52 to i8**
  %54 = load i8*, i8** %53, align 8
  %55 = call i1 @check_token(i8* %54, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.273, i64 0, i64 0))
  %56 = xor i1 %55, 1
  br i1 %56, label %then_19, label %end_if_20
then_19:
  %57 = load i64**, i64*** %ptr_p
  %58 = call i64** @parse_expression(i64** %57)
  %59 = icmp eq i64** %58, null
  br i1 %59, label %when_none_22, label %when_val_23
when_none_22:
  br label %when_end_21
when_val_23:
  store i64** %58, i64*** %ptr_arg
  %60 = load i64**, i64*** %ptr_arg
  %61 = load i64*, i64** %60
  call void @push_expr_list(i64** %45, i64* %61)
  br label %when_end_21
when_end_21:
  br label %while_cond_24
while_cond_24:
  %62 = load i64**, i64*** %ptr_p
  %63 = bitcast i64** %62 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 1
  %65 = bitcast i64* %64 to i8**
  %66 = load i8*, i8** %65, align 8
  %67 = bitcast i8* %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i8**
  %70 = load i8*, i8** %69, align 8
  %71 = call i1 @check_token(i8* %70, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.274, i64 0, i64 0))
  br i1 %71, label %while_body_25, label %while_end_26
while_body_25:
  %72 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %72)
  %73 = load i64**, i64*** %ptr_p
  %74 = call i64** @parse_expression(i64** %73)
  %75 = icmp eq i64** %74, null
  br i1 %75, label %when_none_28, label %when_val_29
when_none_28:
  br label %when_end_27
when_val_29:
  %76 = load i64*, i64** %74
  call void @push_expr_list(i64** %45, i64* %76)
  br label %when_end_27
when_end_27:
  br label %while_cond_24
while_end_26:
  br label %end_if_20
end_if_20:
  %77 = load i64**, i64*** %ptr_p
  %78 = bitcast i64** %77 to i64*
  %79 = getelementptr inbounds i64, i64* %78, i64 1
  %80 = bitcast i64* %79 to i8**
  %81 = load i8*, i8** %80, align 8
  %82 = bitcast i8* %81 to i64*
  %83 = getelementptr inbounds i64, i64* %82, i64 1
  %84 = bitcast i64* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = load i64**, i64*** %ptr_p
  %87 = bitcast i64** %86 to i64*
  %88 = getelementptr inbounds i64, i64* %87, i64 1
  %89 = bitcast i64* %88 to i8**
  %90 = load i8*, i8** %89, align 8
  %91 = bitcast i8* %90 to i64*
  %92 = getelementptr inbounds i64, i64* %91, i64 2
  %93 = bitcast i64* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = load i64**, i64*** %ptr_p
  %96 = call i1 @consume(i64** %95, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.275, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.276, i64 0, i64 0))
  %97 = load i64**, i64*** %ptr_left
  %98 = bitcast i64** %97 to i64*
  %99 = getelementptr inbounds i64, i64* %98, i64 1
  %100 = bitcast i64* %99 to i8**
  %101 = load i8*, i8** %100, align 8
  %102 = bitcast i8* %101 to i64*
  %103 = getelementptr inbounds i64, i64* %102, i64 0
  %104 = bitcast i64* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = load i64**, i64*** %ptr_left
  %107 = bitcast i64** %106 to i64*
  %108 = getelementptr inbounds i64, i64* %107, i64 1
  %109 = bitcast i64* %108 to i8**
  %110 = load i8*, i8** %109, align 8
  %111 = bitcast i8* %110 to i64*
  %112 = getelementptr inbounds i64, i64* %111, i64 1
  %113 = bitcast i64* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = call i64** @alloc_span(i64 %105, i64 %114, i64 %85, i64 %94)
  store i64** %115, i64*** %ptr_span
  %116 = call i8* @malloc(i64 16)
  %117 = bitcast i8* %116 to i64*
  %118 = load i64**, i64*** %ptr_left
  %119 = bitcast i64* %117 to i64*
  %120 = getelementptr inbounds i64, i64* %119, i64 0
  %121 = bitcast i64* %120 to i64***
  store i64** %118, i64*** %121, align 8
  %122 = bitcast i64* %117 to i64*
  %123 = getelementptr inbounds i64, i64* %122, i64 1
  %124 = bitcast i64* %123 to i8**
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.269, i64 0, i64 0), i8** %124, align 8
  %125 = load i64**, i64*** %ptr_left
  %126 = bitcast i64** %125 to i64*
  %127 = getelementptr inbounds i64, i64* %126, i64 1
  %128 = bitcast i64* %127 to i8**
  %129 = load i8*, i8** %128, align 8
  %130 = bitcast i8* %129 to i64*
  %131 = getelementptr inbounds i64, i64* %130, i64 0
  %132 = bitcast i64* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = load i64**, i64*** %ptr_left
  %135 = bitcast i64** %134 to i64*
  %136 = getelementptr inbounds i64, i64* %135, i64 1
  %137 = bitcast i64* %136 to i8**
  %138 = load i8*, i8** %137, align 8
  %139 = bitcast i8* %138 to i64*
  %140 = getelementptr inbounds i64, i64* %139, i64 1
  %141 = bitcast i64* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = call i64** @alloc_span(i64 %133, i64 %142, i64 %85, i64 %94)
  %144 = call i8* @malloc(i64 16)
  %145 = bitcast i8* %144 to i64*
  %146 = bitcast i64* %145 to i64*
  %147 = getelementptr inbounds i64, i64* %146, i64 1
  %148 = bitcast i64* %147 to i64***
  store i64** %143, i64*** %148, align 8
  %149 = call i8* @malloc(i64 16)
  %150 = bitcast i8* %149 to i64*
  %151 = load i64, i64* %117
  store i64 %151, i64* %150
  %152 = call i8* @malloc(i64 16)
  %153 = bitcast i8* %152 to i64*
  %154 = getelementptr inbounds i64, i64* %153, i64 0
  store i64 2, i64* %154
  %155 = getelementptr inbounds i64, i64* %153, i64 1
  %156 = bitcast i64* %155 to i64**
  store i64* %150, i64** %156
  %157 = bitcast i64* %145 to i64*
  %158 = getelementptr inbounds i64, i64* %157, i64 0
  %159 = bitcast i64* %158 to i64**
  store i64* %153, i64** %159, align 8
  %160 = call i8* @malloc(i64 16)
  %161 = bitcast i8* %160 to i64*
  store i64* %161, i64*** %ptr_call
  %162 = load i64**, i64*** %ptr_call
  %163 = bitcast i64** %162 to i64*
  %164 = getelementptr inbounds i64, i64* %163, i64 0
  %165 = bitcast i64* %164 to i64**
  store i64* %145, i64** %165, align 8
  %166 = load i64**, i64*** %ptr_call
  %167 = bitcast i64** %166 to i64*
  %168 = getelementptr inbounds i64, i64* %167, i64 1
  %169 = bitcast i64* %168 to i64***
  store i64** %45, i64*** %169, align 8
  %170 = call i8* @malloc(i64 16)
  %171 = bitcast i8* %170 to i64*
  store i64* %171, i64*** %ptr_expr
  %172 = load i64**, i64*** %ptr_expr
  %173 = load i64**, i64*** %ptr_span
  %174 = bitcast i64** %172 to i64*
  %175 = getelementptr inbounds i64, i64* %174, i64 1
  %176 = bitcast i64* %175 to i64***
  store i64** %173, i64*** %176, align 8
  %177 = call i8* @malloc(i64 16)
  %178 = bitcast i8* %177 to i64*
  %179 = load i64**, i64*** %ptr_call
  %180 = load i64*, i64** %179
  store i64* %180, i64* %178
  %181 = call i8* @malloc(i64 16)
  %182 = bitcast i8* %181 to i64*
  %183 = getelementptr inbounds i64, i64* %182, i64 0
  store i64 3, i64* %183
  %184 = getelementptr inbounds i64, i64* %182, i64 1
  %185 = bitcast i64* %184 to i64**
  store i64* %178, i64** %185
  %186 = load i64**, i64*** %ptr_expr
  %187 = bitcast i64** %186 to i64*
  %188 = getelementptr inbounds i64, i64* %187, i64 0
  %189 = bitcast i64* %188 to i64**
  store i64* %182, i64** %189, align 8
  %190 = load i64**, i64*** %ptr_expr
  store i64** %190, i64*** %ptr_left
  br label %end_if_17
else_18:
  %191 = load i64**, i64*** %ptr_left
  %192 = bitcast i64** %191 to i64*
  %193 = getelementptr inbounds i64, i64* %192, i64 1
  %194 = bitcast i64* %193 to i8**
  %195 = load i8*, i8** %194, align 8
  %196 = bitcast i8* %195 to i64*
  %197 = getelementptr inbounds i64, i64* %196, i64 0
  %198 = bitcast i64* %197 to i64*
  %199 = load i64, i64* %198, align 8
  %200 = load i64**, i64*** %ptr_left
  %201 = bitcast i64** %200 to i64*
  %202 = getelementptr inbounds i64, i64* %201, i64 1
  %203 = bitcast i64* %202 to i8**
  %204 = load i8*, i8** %203, align 8
  %205 = bitcast i8* %204 to i64*
  %206 = getelementptr inbounds i64, i64* %205, i64 1
  %207 = bitcast i64* %206 to i64*
  %208 = load i64, i64* %207, align 8
  %209 = load i64**, i64*** %ptr_p
  %210 = bitcast i64** %209 to i64*
  %211 = getelementptr inbounds i64, i64* %210, i64 1
  %212 = bitcast i64* %211 to i8**
  %213 = load i8*, i8** %212, align 8
  %214 = bitcast i8* %213 to i64*
  %215 = getelementptr inbounds i64, i64* %214, i64 1
  %216 = bitcast i64* %215 to i64*
  %217 = load i64, i64* %216, align 8
  %218 = load i64**, i64*** %ptr_p
  %219 = bitcast i64** %218 to i64*
  %220 = getelementptr inbounds i64, i64* %219, i64 1
  %221 = bitcast i64* %220 to i8**
  %222 = load i8*, i8** %221, align 8
  %223 = bitcast i8* %222 to i64*
  %224 = getelementptr inbounds i64, i64* %223, i64 2
  %225 = bitcast i64* %224 to i64*
  %226 = load i64, i64* %225, align 8
  %227 = call i64** @alloc_span(i64 %199, i64 %208, i64 %217, i64 %226)
  store i64** %227, i64*** %ptr_span
  %228 = call i8* @malloc(i64 16)
  %229 = bitcast i8* %228 to i64*
  store i64* %229, i64* %117
  %230 = load i64**, i64*** %ptr_left
  %231 = bitcast i64* %117 to i64*
  %232 = getelementptr inbounds i64, i64* %231, i64 0
  %233 = bitcast i64* %232 to i64***
  store i64** %230, i64*** %233, align 8
  %234 = bitcast i64* %117 to i64*
  %235 = getelementptr inbounds i64, i64* %234, i64 1
  %236 = bitcast i64* %235 to i8**
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.269, i64 0, i64 0), i8** %236, align 8
  %237 = call i8* @malloc(i64 16)
  %238 = bitcast i8* %237 to i64*
  store i64* %238, i64*** %ptr_expr
  %239 = load i64**, i64*** %ptr_expr
  %240 = load i64**, i64*** %ptr_span
  %241 = bitcast i64** %239 to i64*
  %242 = getelementptr inbounds i64, i64* %241, i64 1
  %243 = bitcast i64* %242 to i64***
  store i64** %240, i64*** %243, align 8
  %244 = call i8* @malloc(i64 16)
  %245 = bitcast i8* %244 to i64*
  %246 = load i64, i64* %117
  store i64 %246, i64* %245
  %247 = call i8* @malloc(i64 16)
  %248 = bitcast i8* %247 to i64*
  %249 = getelementptr inbounds i64, i64* %248, i64 0
  store i64 2, i64* %249
  %250 = getelementptr inbounds i64, i64* %248, i64 1
  %251 = bitcast i64* %250 to i64**
  store i64* %245, i64** %251
  %252 = load i64**, i64*** %ptr_expr
  %253 = bitcast i64** %252 to i64*
  %254 = getelementptr inbounds i64, i64* %253, i64 0
  %255 = bitcast i64* %254 to i64**
  store i64* %248, i64** %255, align 8
  %256 = load i64**, i64*** %ptr_expr
  store i64** %256, i64*** %ptr_left
  br label %end_if_17
end_if_17:
  br label %end_if_8
else_9:
  %257 = load i64**, i64*** %ptr_p
  %258 = bitcast i64** %257 to i64*
  %259 = getelementptr inbounds i64, i64* %258, i64 1
  %260 = bitcast i64* %259 to i8**
  %261 = load i8*, i8** %260, align 8
  %262 = bitcast i8* %261 to i64*
  %263 = getelementptr inbounds i64, i64* %262, i64 0
  %264 = bitcast i64* %263 to i8**
  %265 = load i8*, i8** %264, align 8
  %266 = call i1 @check_token(i8* %265, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.277, i64 0, i64 0))
  br i1 %266, label %then_30, label %else_32
then_30:
  %267 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %267)
  %268 = call i64** @new_empty_expr_list()
  store i64** %268, i64** %45
  %269 = load i64**, i64*** %ptr_p
  %270 = bitcast i64** %269 to i64*
  %271 = getelementptr inbounds i64, i64* %270, i64 1
  %272 = bitcast i64* %271 to i8**
  %273 = load i8*, i8** %272, align 8
  %274 = bitcast i8* %273 to i64*
  %275 = getelementptr inbounds i64, i64* %274, i64 0
  %276 = bitcast i64* %275 to i8**
  %277 = load i8*, i8** %276, align 8
  %278 = call i1 @check_token(i8* %277, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.278, i64 0, i64 0))
  %279 = xor i1 %278, 1
  br i1 %279, label %then_33, label %end_if_34
then_33:
  %280 = load i64**, i64*** %ptr_p
  %281 = call i64** @parse_expression(i64** %280)
  store i64** %281, i64** %58
  %282 = icmp eq i64** %58, null
  br i1 %282, label %when_none_36, label %when_val_37
when_none_36:
  br label %when_end_35
when_val_37:
  store i64** %58, i64*** %ptr_arg
  %283 = load i64**, i64*** %ptr_arg
  %284 = load i64*, i64** %283
  call void @push_expr_list(i64** %45, i64* %284)
  br label %when_end_35
when_end_35:
  br label %while_cond_38
while_cond_38:
  %285 = load i64**, i64*** %ptr_p
  %286 = bitcast i64** %285 to i64*
  %287 = getelementptr inbounds i64, i64* %286, i64 1
  %288 = bitcast i64* %287 to i8**
  %289 = load i8*, i8** %288, align 8
  %290 = bitcast i8* %289 to i64*
  %291 = getelementptr inbounds i64, i64* %290, i64 0
  %292 = bitcast i64* %291 to i8**
  %293 = load i8*, i8** %292, align 8
  %294 = call i1 @check_token(i8* %293, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.279, i64 0, i64 0))
  br i1 %294, label %while_body_39, label %while_end_40
while_body_39:
  %295 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %295)
  %296 = load i64**, i64*** %ptr_p
  %297 = call i64** @parse_expression(i64** %296)
  store i64** %297, i64** %74
  %298 = icmp eq i64** %74, null
  br i1 %298, label %when_none_42, label %when_val_43
when_none_42:
  br label %when_end_41
when_val_43:
  store i64** %74, i64** %74
  %299 = load i64*, i64** %74
  call void @push_expr_list(i64** %45, i64* %299)
  br label %when_end_41
when_end_41:
  br label %while_cond_38
while_end_40:
  br label %end_if_34
end_if_34:
  %300 = load i64**, i64*** %ptr_p
  %301 = bitcast i64** %300 to i64*
  %302 = getelementptr inbounds i64, i64* %301, i64 1
  %303 = bitcast i64* %302 to i8**
  %304 = load i8*, i8** %303, align 8
  %305 = bitcast i8* %304 to i64*
  %306 = getelementptr inbounds i64, i64* %305, i64 1
  %307 = bitcast i64* %306 to i64*
  %308 = load i64, i64* %307, align 8
  store i64 %308, i64 %85
  %309 = load i64**, i64*** %ptr_p
  %310 = bitcast i64** %309 to i64*
  %311 = getelementptr inbounds i64, i64* %310, i64 1
  %312 = bitcast i64* %311 to i8**
  %313 = load i8*, i8** %312, align 8
  %314 = bitcast i8* %313 to i64*
  %315 = getelementptr inbounds i64, i64* %314, i64 2
  %316 = bitcast i64* %315 to i64*
  %317 = load i64, i64* %316, align 8
  store i64 %317, i64 %94
  %318 = load i64**, i64*** %ptr_p
  %319 = call i1 @consume(i64** %318, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.280, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.281, i64 0, i64 0))
  %320 = load i64**, i64*** %ptr_left
  %321 = bitcast i64** %320 to i64*
  %322 = getelementptr inbounds i64, i64* %321, i64 1
  %323 = bitcast i64* %322 to i8**
  %324 = load i8*, i8** %323, align 8
  %325 = bitcast i8* %324 to i64*
  %326 = getelementptr inbounds i64, i64* %325, i64 0
  %327 = bitcast i64* %326 to i64*
  %328 = load i64, i64* %327, align 8
  %329 = load i64**, i64*** %ptr_left
  %330 = bitcast i64** %329 to i64*
  %331 = getelementptr inbounds i64, i64* %330, i64 1
  %332 = bitcast i64* %331 to i8**
  %333 = load i8*, i8** %332, align 8
  %334 = bitcast i8* %333 to i64*
  %335 = getelementptr inbounds i64, i64* %334, i64 1
  %336 = bitcast i64* %335 to i64*
  %337 = load i64, i64* %336, align 8
  %338 = call i64** @alloc_span(i64 %328, i64 %337, i64 %85, i64 %94)
  store i64** %338, i64*** %ptr_span
  %339 = call i8* @malloc(i64 16)
  %340 = bitcast i8* %339 to i64*
  store i64* %340, i64*** %ptr_call
  %341 = load i64**, i64*** %ptr_call
  %342 = load i64**, i64*** %ptr_left
  %343 = bitcast i64** %341 to i64*
  %344 = getelementptr inbounds i64, i64* %343, i64 0
  %345 = bitcast i64* %344 to i64***
  store i64** %342, i64*** %345, align 8
  %346 = load i64**, i64*** %ptr_call
  %347 = bitcast i64** %346 to i64*
  %348 = getelementptr inbounds i64, i64* %347, i64 1
  %349 = bitcast i64* %348 to i64***
  store i64** %45, i64*** %349, align 8
  %350 = call i8* @malloc(i64 16)
  %351 = bitcast i8* %350 to i64*
  store i64* %351, i64*** %ptr_expr
  %352 = load i64**, i64*** %ptr_expr
  %353 = load i64**, i64*** %ptr_span
  %354 = bitcast i64** %352 to i64*
  %355 = getelementptr inbounds i64, i64* %354, i64 1
  %356 = bitcast i64* %355 to i64***
  store i64** %353, i64*** %356, align 8
  %357 = call i8* @malloc(i64 16)
  %358 = bitcast i8* %357 to i64*
  store i64* %358, i64* %245
  %359 = load i64**, i64*** %ptr_call
  %360 = load i64*, i64** %359
  store i64* %360, i64* %245
  %361 = call i8* @malloc(i64 16)
  %362 = bitcast i8* %361 to i64*
  %363 = getelementptr inbounds i64, i64* %362, i64 0
  store i64 3, i64* %363
  %364 = getelementptr inbounds i64, i64* %362, i64 1
  %365 = bitcast i64* %364 to i64**
  store i64* %245, i64** %365
  %366 = load i64**, i64*** %ptr_expr
  %367 = bitcast i64** %366 to i64*
  %368 = getelementptr inbounds i64, i64* %367, i64 0
  %369 = bitcast i64* %368 to i64**
  store i64* %362, i64** %369, align 8
  %370 = load i64**, i64*** %ptr_expr
  store i64** %370, i64*** %ptr_left
  br label %end_if_31
else_32:
  %371 = load i64**, i64*** %ptr_p
  %372 = bitcast i64** %371 to i64*
  %373 = getelementptr inbounds i64, i64* %372, i64 1
  %374 = bitcast i64* %373 to i8**
  %375 = load i8*, i8** %374, align 8
  %376 = bitcast i8* %375 to i64*
  %377 = getelementptr inbounds i64, i64* %376, i64 0
  %378 = bitcast i64* %377 to i8**
  %379 = load i8*, i8** %378, align 8
  %380 = call i1 @check_token(i8* %379, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.282, i64 0, i64 0))
  br i1 %380, label %then_44, label %else_46
then_44:
  %381 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %381)
  %382 = load i64**, i64*** %ptr_left
  %383 = bitcast i64** %382 to i64*
  %384 = getelementptr inbounds i64, i64* %383, i64 1
  %385 = bitcast i64* %384 to i8**
  %386 = load i8*, i8** %385, align 8
  %387 = bitcast i8* %386 to i64*
  %388 = getelementptr inbounds i64, i64* %387, i64 0
  %389 = bitcast i64* %388 to i64*
  %390 = load i64, i64* %389, align 8
  %391 = load i64**, i64*** %ptr_left
  %392 = bitcast i64** %391 to i64*
  %393 = getelementptr inbounds i64, i64* %392, i64 1
  %394 = bitcast i64* %393 to i8**
  %395 = load i8*, i8** %394, align 8
  %396 = bitcast i8* %395 to i64*
  %397 = getelementptr inbounds i64, i64* %396, i64 1
  %398 = bitcast i64* %397 to i64*
  %399 = load i64, i64* %398, align 8
  %400 = load i64**, i64*** %ptr_p
  %401 = bitcast i64** %400 to i64*
  %402 = getelementptr inbounds i64, i64* %401, i64 1
  %403 = bitcast i64* %402 to i8**
  %404 = load i8*, i8** %403, align 8
  %405 = bitcast i8* %404 to i64*
  %406 = getelementptr inbounds i64, i64* %405, i64 1
  %407 = bitcast i64* %406 to i64*
  %408 = load i64, i64* %407, align 8
  %409 = load i64**, i64*** %ptr_p
  %410 = bitcast i64** %409 to i64*
  %411 = getelementptr inbounds i64, i64* %410, i64 1
  %412 = bitcast i64* %411 to i8**
  %413 = load i8*, i8** %412, align 8
  %414 = bitcast i8* %413 to i64*
  %415 = getelementptr inbounds i64, i64* %414, i64 2
  %416 = bitcast i64* %415 to i64*
  %417 = load i64, i64* %416, align 8
  %418 = call i64** @alloc_span(i64 %390, i64 %399, i64 %408, i64 %417)
  store i64** %418, i64*** %ptr_span
  %419 = call i8* @malloc(i64 16)
  %420 = bitcast i8* %419 to i64*
  store i64* %420, i64*** %ptr_expr
  %421 = load i64**, i64*** %ptr_expr
  %422 = load i64**, i64*** %ptr_span
  %423 = bitcast i64** %421 to i64*
  %424 = getelementptr inbounds i64, i64* %423, i64 1
  %425 = bitcast i64* %424 to i64***
  store i64** %422, i64*** %425, align 8
  %426 = call i8* @malloc(i64 16)
  %427 = bitcast i8* %426 to i64*
  %428 = getelementptr inbounds i64, i64* %427, i64 0
  store i64 6, i64* %428
  %429 = load i64**, i64*** %ptr_left
  %430 = getelementptr inbounds i64, i64* %427, i64 1
  %431 = bitcast i64* %430 to i64***
  store i64** %429, i64*** %431
  %432 = load i64**, i64*** %ptr_expr
  %433 = bitcast i64** %432 to i64*
  %434 = getelementptr inbounds i64, i64* %433, i64 0
  %435 = bitcast i64* %434 to i64**
  store i64* %427, i64** %435, align 8
  %436 = load i64**, i64*** %ptr_expr
  store i64** %436, i64*** %ptr_left
  br label %end_if_45
else_46:
  %437 = load i64**, i64*** %ptr_p
  %438 = bitcast i64** %437 to i64*
  %439 = getelementptr inbounds i64, i64* %438, i64 1
  %440 = bitcast i64* %439 to i8**
  %441 = load i8*, i8** %440, align 8
  %442 = bitcast i8* %441 to i64*
  %443 = getelementptr inbounds i64, i64* %442, i64 0
  %444 = bitcast i64* %443 to i8**
  %445 = load i8*, i8** %444, align 8
  %446 = call i1 @check_token(i8* %445, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.283, i64 0, i64 0))
  br i1 %446, label %then_47, label %else_49
then_47:
  %447 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %447)
  store i8* null, i64*** %ptr_start_expr
  store i1 0, i1* %ptr_is_slice
  %448 = load i64**, i64*** %ptr_p
  %449 = bitcast i64** %448 to i64*
  %450 = getelementptr inbounds i64, i64* %449, i64 1
  %451 = bitcast i64* %450 to i8**
  %452 = load i8*, i8** %451, align 8
  %453 = bitcast i8* %452 to i64*
  %454 = getelementptr inbounds i64, i64* %453, i64 0
  %455 = bitcast i64* %454 to i8**
  %456 = load i8*, i8** %455, align 8
  %457 = call i1 @check_token(i8* %456, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.284, i64 0, i64 0))
  %458 = xor i1 %457, 1
  br i1 %458, label %then_50, label %else_52
then_50:
  %459 = load i64**, i64*** %ptr_p
  %460 = bitcast i64** %459 to i64*
  %461 = getelementptr inbounds i64, i64* %460, i64 1
  %462 = bitcast i64* %461 to i8**
  %463 = load i8*, i8** %462, align 8
  %464 = bitcast i8* %463 to i64*
  %465 = getelementptr inbounds i64, i64* %464, i64 0
  %466 = bitcast i64* %465 to i8**
  %467 = load i8*, i8** %466, align 8
  %468 = call i1 @check_token(i8* %467, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.285, i64 0, i64 0))
  br i1 %468, label %then_53, label %else_55
then_53:
  store i1 1, i1* %ptr_is_slice
  %469 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %469)
  %470 = load i64**, i64*** %ptr_p
  %471 = bitcast i64** %470 to i64*
  %472 = getelementptr inbounds i64, i64* %471, i64 1
  %473 = bitcast i64* %472 to i8**
  %474 = load i8*, i8** %473, align 8
  %475 = bitcast i8* %474 to i64*
  %476 = getelementptr inbounds i64, i64* %475, i64 0
  %477 = bitcast i64* %476 to i8**
  %478 = load i8*, i8** %477, align 8
  %479 = call i1 @check_token(i8* %478, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.286, i64 0, i64 0))
  %480 = xor i1 %479, 1
  br i1 %480, label %then_56, label %end_if_57
then_56:
  %481 = load i64**, i64*** %ptr_p
  %482 = call i64** @parse_expression(i64** %481)
  store i64** %482, i8* null
  br label %end_if_57
end_if_57:
  br label %end_if_54
else_55:
  %483 = load i64**, i64*** %ptr_p
  %484 = call i64** @parse_expression(i64** %483)
  store i64** %484, i64*** %ptr_start_expr
  %485 = load i64**, i64*** %ptr_p
  %486 = bitcast i64** %485 to i64*
  %487 = getelementptr inbounds i64, i64* %486, i64 1
  %488 = bitcast i64* %487 to i8**
  %489 = load i8*, i8** %488, align 8
  %490 = bitcast i8* %489 to i64*
  %491 = getelementptr inbounds i64, i64* %490, i64 0
  %492 = bitcast i64* %491 to i8**
  %493 = load i8*, i8** %492, align 8
  %494 = call i1 @check_token(i8* %493, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.287, i64 0, i64 0))
  br i1 %494, label %then_58, label %else_60
then_58:
  store i1 1, i1* %ptr_is_slice
  %495 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %495)
  %496 = load i64**, i64*** %ptr_p
  %497 = bitcast i64** %496 to i64*
  %498 = getelementptr inbounds i64, i64* %497, i64 1
  %499 = bitcast i64* %498 to i8**
  %500 = load i8*, i8** %499, align 8
  %501 = bitcast i8* %500 to i64*
  %502 = getelementptr inbounds i64, i64* %501, i64 0
  %503 = bitcast i64* %502 to i8**
  %504 = load i8*, i8** %503, align 8
  %505 = call i1 @check_token(i8* %504, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.288, i64 0, i64 0))
  %506 = xor i1 %505, 1
  br i1 %506, label %then_61, label %end_if_62
then_61:
  %507 = load i64**, i64*** %ptr_p
  %508 = call i64** @parse_expression(i64** %507)
  store i64** %508, i8* null
  br label %end_if_62
end_if_62:
  br label %end_if_59
else_60:
  %509 = load i64**, i64*** %ptr_p
  %510 = bitcast i64** %509 to i64*
  %511 = getelementptr inbounds i64, i64* %510, i64 1
  %512 = bitcast i64* %511 to i8**
  %513 = load i8*, i8** %512, align 8
  %514 = bitcast i8* %513 to i64*
  %515 = getelementptr inbounds i64, i64* %514, i64 0
  %516 = bitcast i64* %515 to i8**
  %517 = load i8*, i8** %516, align 8
  %518 = call i1 @check_token(i8* %517, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.289, i64 0, i64 0))
  %519 = xor i1 %518, 1
  br i1 %519, label %then_63, label %else_65
then_63:
  %520 = load i64**, i64*** %ptr_p
  %521 = bitcast i64** %520 to i64*
  %522 = getelementptr inbounds i64, i64* %521, i64 1
  %523 = bitcast i64* %522 to i8**
  %524 = load i8*, i8** %523, align 8
  %525 = bitcast i8* %524 to i64*
  %526 = getelementptr inbounds i64, i64* %525, i64 1
  %527 = bitcast i64* %526 to i64*
  %528 = load i64, i64* %527, align 8
  %529 = load i64**, i64*** %ptr_p
  %530 = bitcast i64** %529 to i64*
  %531 = getelementptr inbounds i64, i64* %530, i64 1
  %532 = bitcast i64* %531 to i8**
  %533 = load i8*, i8** %532, align 8
  %534 = bitcast i8* %533 to i64*
  %535 = getelementptr inbounds i64, i64* %534, i64 2
  %536 = bitcast i64* %535 to i64*
  %537 = load i64, i64* %536, align 8
  %538 = load i64**, i64*** %ptr_p
  %539 = bitcast i64** %538 to i64*
  %540 = getelementptr inbounds i64, i64* %539, i64 1
  %541 = bitcast i64* %540 to i8**
  %542 = load i8*, i8** %541, align 8
  %543 = bitcast i8* %542 to i64*
  %544 = getelementptr inbounds i64, i64* %543, i64 1
  %545 = bitcast i64* %544 to i64*
  %546 = load i64, i64* %545, align 8
  %547 = load i64**, i64*** %ptr_p
  %548 = bitcast i64** %547 to i64*
  %549 = getelementptr inbounds i64, i64* %548, i64 1
  %550 = bitcast i64* %549 to i8**
  %551 = load i8*, i8** %550, align 8
  %552 = bitcast i8* %551 to i64*
  %553 = getelementptr inbounds i64, i64* %552, i64 2
  %554 = bitcast i64* %553 to i64*
  %555 = load i64, i64* %554, align 8
  %556 = call i64** @alloc_span(i64 %528, i64 %537, i64 %546, i64 %555)
  %557 = load i64**, i64*** %ptr_p
  call void @report_error(i64** %557, i64** %556, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.290, i64 0, i64 0))
  store i8* null, i8* null
  ret i8* null
unreachable_66:
  br label %end_if_64
else_65:
  %558 = load i64**, i64*** %ptr_p
  %559 = bitcast i64** %558 to i64*
  %560 = getelementptr inbounds i64, i64* %559, i64 1
  %561 = bitcast i64* %560 to i8**
  %562 = load i8*, i8** %561, align 8
  %563 = bitcast i8* %562 to i64*
  %564 = getelementptr inbounds i64, i64* %563, i64 1
  %565 = bitcast i64* %564 to i64*
  %566 = load i64, i64* %565, align 8
  store i64 %566, i64 %85
  %567 = load i64**, i64*** %ptr_p
  %568 = bitcast i64** %567 to i64*
  %569 = getelementptr inbounds i64, i64* %568, i64 1
  %570 = bitcast i64* %569 to i8**
  %571 = load i8*, i8** %570, align 8
  %572 = bitcast i8* %571 to i64*
  %573 = getelementptr inbounds i64, i64* %572, i64 2
  %574 = bitcast i64* %573 to i64*
  %575 = load i64, i64* %574, align 8
  store i64 %575, i64 %94
  %576 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %576)
  %577 = load i64**, i64*** %ptr_left
  %578 = bitcast i64** %577 to i64*
  %579 = getelementptr inbounds i64, i64* %578, i64 1
  %580 = bitcast i64* %579 to i8**
  %581 = load i8*, i8** %580, align 8
  %582 = bitcast i8* %581 to i64*
  %583 = getelementptr inbounds i64, i64* %582, i64 0
  %584 = bitcast i64* %583 to i64*
  %585 = load i64, i64* %584, align 8
  %586 = load i64**, i64*** %ptr_left
  %587 = bitcast i64** %586 to i64*
  %588 = getelementptr inbounds i64, i64* %587, i64 1
  %589 = bitcast i64* %588 to i8**
  %590 = load i8*, i8** %589, align 8
  %591 = bitcast i8* %590 to i64*
  %592 = getelementptr inbounds i64, i64* %591, i64 1
  %593 = bitcast i64* %592 to i64*
  %594 = load i64, i64* %593, align 8
  %595 = call i64** @alloc_span(i64 %585, i64 %594, i64 %85, i64 %94)
  store i64** %595, i64*** %ptr_span
  %596 = load i64**, i64*** %ptr_start_expr
  %597 = icmp eq i64** %596, null
  br i1 %597, label %when_none_68, label %when_val_69
when_none_68:
  br label %when_end_67
when_val_69:
  %598 = load i64**, i64*** %ptr_start_expr
  store i64** %598, i64*** %ptr_idx
  %599 = call i8* @malloc(i64 16)
  %600 = bitcast i8* %599 to i64*
  store i64* %600, i64*** %ptr_idx_expr
  %601 = load i64**, i64*** %ptr_idx_expr
  %602 = load i64**, i64*** %ptr_left
  %603 = bitcast i64** %601 to i64*
  %604 = getelementptr inbounds i64, i64* %603, i64 0
  %605 = bitcast i64* %604 to i64***
  store i64** %602, i64*** %605, align 8
  %606 = load i64**, i64*** %ptr_idx_expr
  %607 = load i64**, i64*** %ptr_idx
  %608 = bitcast i64** %606 to i64*
  %609 = getelementptr inbounds i64, i64* %608, i64 1
  %610 = bitcast i64* %609 to i64***
  store i64** %607, i64*** %610, align 8
  %611 = call i8* @malloc(i64 16)
  %612 = bitcast i8* %611 to i64*
  store i64* %612, i64*** %ptr_expr
  %613 = load i64**, i64*** %ptr_expr
  %614 = load i64**, i64*** %ptr_span
  %615 = bitcast i64** %613 to i64*
  %616 = getelementptr inbounds i64, i64* %615, i64 1
  %617 = bitcast i64* %616 to i64***
  store i64** %614, i64*** %617, align 8
  %618 = call i8* @malloc(i64 16)
  %619 = bitcast i8* %618 to i64*
  store i64* %619, i64* %245
  %620 = load i64**, i64*** %ptr_idx_expr
  %621 = load i64*, i64** %620
  store i64* %621, i64* %245
  %622 = call i8* @malloc(i64 16)
  %623 = bitcast i8* %622 to i64*
  %624 = getelementptr inbounds i64, i64* %623, i64 0
  store i64 8, i64* %624
  %625 = getelementptr inbounds i64, i64* %623, i64 1
  %626 = bitcast i64* %625 to i64**
  store i64* %245, i64** %626
  %627 = load i64**, i64*** %ptr_expr
  %628 = bitcast i64** %627 to i64*
  %629 = getelementptr inbounds i64, i64* %628, i64 0
  %630 = bitcast i64* %629 to i64**
  store i64* %623, i64** %630, align 8
  %631 = load i64**, i64*** %ptr_expr
  store i64** %631, i64*** %ptr_left
  br label %when_end_67
when_end_67:
  store i1 1, i1* %ptr_parsing
  br label %end_if_64
end_if_64:
  br label %end_if_59
end_if_59:
  br label %end_if_54
end_if_54:
  br label %end_if_51
else_52:
  store i1 1, i1* %ptr_is_slice
  br label %end_if_51
end_if_51:
  %632 = load i1, i1* %ptr_is_slice
  br i1 %632, label %then_70, label %end_if_71
then_70:
  %633 = load i64**, i64*** %ptr_p
  %634 = bitcast i64** %633 to i64*
  %635 = getelementptr inbounds i64, i64* %634, i64 1
  %636 = bitcast i64* %635 to i8**
  %637 = load i8*, i8** %636, align 8
  %638 = bitcast i8* %637 to i64*
  %639 = getelementptr inbounds i64, i64* %638, i64 1
  %640 = bitcast i64* %639 to i64*
  %641 = load i64, i64* %640, align 8
  store i64 %641, i64 %85
  %642 = load i64**, i64*** %ptr_p
  %643 = bitcast i64** %642 to i64*
  %644 = getelementptr inbounds i64, i64* %643, i64 1
  %645 = bitcast i64* %644 to i8**
  %646 = load i8*, i8** %645, align 8
  %647 = bitcast i8* %646 to i64*
  %648 = getelementptr inbounds i64, i64* %647, i64 2
  %649 = bitcast i64* %648 to i64*
  %650 = load i64, i64* %649, align 8
  store i64 %650, i64 %94
  %651 = load i64**, i64*** %ptr_p
  %652 = call i1 @consume(i64** %651, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.291, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.292, i64 0, i64 0))
  %653 = load i64**, i64*** %ptr_left
  %654 = bitcast i64** %653 to i64*
  %655 = getelementptr inbounds i64, i64* %654, i64 1
  %656 = bitcast i64* %655 to i8**
  %657 = load i8*, i8** %656, align 8
  %658 = bitcast i8* %657 to i64*
  %659 = getelementptr inbounds i64, i64* %658, i64 0
  %660 = bitcast i64* %659 to i64*
  %661 = load i64, i64* %660, align 8
  %662 = load i64**, i64*** %ptr_left
  %663 = bitcast i64** %662 to i64*
  %664 = getelementptr inbounds i64, i64* %663, i64 1
  %665 = bitcast i64* %664 to i8**
  %666 = load i8*, i8** %665, align 8
  %667 = bitcast i8* %666 to i64*
  %668 = getelementptr inbounds i64, i64* %667, i64 1
  %669 = bitcast i64* %668 to i64*
  %670 = load i64, i64* %669, align 8
  %671 = call i64** @alloc_span(i64 %661, i64 %670, i64 %85, i64 %94)
  store i64** %671, i64*** %ptr_span
  %672 = call i8* @malloc(i64 24)
  %673 = bitcast i8* %672 to i64*
  store i64* %673, i64*** %ptr_slice
  %674 = load i64**, i64*** %ptr_slice
  %675 = load i64**, i64*** %ptr_left
  %676 = bitcast i64** %674 to i64*
  %677 = getelementptr inbounds i64, i64* %676, i64 0
  %678 = bitcast i64* %677 to i64***
  store i64** %675, i64*** %678, align 8
  %679 = load i64**, i64*** %ptr_slice
  %680 = load i64**, i64*** %ptr_start_expr
  %681 = bitcast i64** %679 to i64*
  %682 = getelementptr inbounds i64, i64* %681, i64 1
  %683 = bitcast i64* %682 to i64***
  store i64** %680, i64*** %683, align 8
  %684 = load i64**, i64*** %ptr_slice
  %685 = bitcast i64** %684 to i64*
  %686 = getelementptr inbounds i64, i64* %685, i64 2
  %687 = bitcast i64* %686 to i8**
  store i8* null, i8** %687, align 8
  %688 = call i8* @malloc(i64 16)
  %689 = bitcast i8* %688 to i64*
  store i64* %689, i64*** %ptr_expr
  %690 = load i64**, i64*** %ptr_expr
  %691 = load i64**, i64*** %ptr_span
  %692 = bitcast i64** %690 to i64*
  %693 = getelementptr inbounds i64, i64* %692, i64 1
  %694 = bitcast i64* %693 to i64***
  store i64** %691, i64*** %694, align 8
  %695 = call i8* @malloc(i64 24)
  %696 = bitcast i8* %695 to i64*
  store i64* %696, i64* %245
  %697 = load i64**, i64*** %ptr_slice
  %698 = load i64*, i64** %697
  store i64* %698, i64* %245
  %699 = call i8* @malloc(i64 16)
  %700 = bitcast i8* %699 to i64*
  %701 = getelementptr inbounds i64, i64* %700, i64 0
  store i64 7, i64* %701
  %702 = getelementptr inbounds i64, i64* %700, i64 1
  %703 = bitcast i64* %702 to i64**
  store i64* %245, i64** %703
  %704 = load i64**, i64*** %ptr_expr
  %705 = bitcast i64** %704 to i64*
  %706 = getelementptr inbounds i64, i64* %705, i64 0
  %707 = bitcast i64* %706 to i64**
  store i64* %700, i64** %707, align 8
  %708 = load i64**, i64*** %ptr_expr
  store i64** %708, i64*** %ptr_left
  br label %end_if_71
end_if_71:
  br label %end_if_48
else_49:
  store i1 0, i1* %ptr_parsing
  br label %end_if_48
end_if_48:
  br label %end_if_45
end_if_45:
  br label %end_if_31
end_if_31:
  br label %end_if_8
end_if_8:
  br label %while_cond_4
while_end_6:
  %709 = load i64**, i64*** %ptr_left
  store i64** %709, i8* null
  ret i8* null
unreachable_72:
  br label %when_end_0
when_end_0:
  ret i64** null
}

define i64** @parse_when_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = call i1 @consume(i64** %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.293, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.294, i64 0, i64 0))
  %3 = load i64**, i64*** %ptr_p
  %4 = call i64** @parse_expression(i64** %3)
  store i64** %4, i64*** %ptr_target_opt
  %5 = load i64**, i64*** %ptr_target_opt
  %6 = icmp eq i64** %5, null
  br i1 %6, label %when_none_1, label %when_val_2
when_none_1:
  ret i8* null
unreachable_3:
  br label %when_end_0
when_val_2:
  %7 = load i64**, i64*** %ptr_target_opt
  store i64** %7, i64*** %ptr_t
  %8 = load i64**, i64*** %ptr_t
  store i64** %8, i64*** %ptr_target
  br label %when_end_0
when_end_0:
  %9 = load i64**, i64*** %ptr_p
  %10 = call i1 @consume(i64** %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.295, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.296, i64 0, i64 0))
  %11 = call i8* @malloc(i64 24)
  %12 = bitcast i8* %11 to i64*
  store i64* %12, i64*** %ptr_dummy_case
  %13 = load i64**, i64*** %ptr_dummy_case
  %14 = call i64** @new_list_WhenCase(i64 4, i64** %13)
  br label %while_cond_4
while_cond_4:
  %15 = load i64**, i64*** %ptr_p
  %16 = bitcast i64** %15 to i64*
  %17 = getelementptr inbounds i64, i64* %16, i64 1
  %18 = bitcast i64* %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast i8* %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 0
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = call i1 @check_token(i8* %23, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.297, i64 0, i64 0))
  %25 = xor i1 %24, 1
  %26 = load i64**, i64*** %ptr_p
  %27 = bitcast i64** %26 to i64*
  %28 = getelementptr inbounds i64, i64* %27, i64 1
  %29 = bitcast i64* %28 to i8**
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to i64*
  %32 = getelementptr inbounds i64, i64* %31, i64 0
  %33 = bitcast i64* %32 to i8**
  %34 = load i8*, i8** %33, align 8
  %35 = call i1 @check_token(i8* %34, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.298, i64 0, i64 0))
  %36 = xor i1 %35, 1
  %37 = and i1 %25, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_p
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 1
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = bitcast i8* %42 to i64*
  %44 = getelementptr inbounds i64, i64* %43, i64 0
  %45 = bitcast i64* %44 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = call i1 @check_token(i8* %46, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.299, i64 0, i64 0))
  br i1 %47, label %then_7, label %else_9
then_7:
  %48 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %48)
  br label %end_if_8
else_9:
  %49 = load i64**, i64*** %ptr_p
  %50 = call i8* @consume_ident(i64** %49, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.301, i64 0, i64 0))
  store i8* %50, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.300, i64 0, i64 0)
  %51 = call i32 @strcmp(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.300, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.302, i64 0, i64 0))
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %then_10, label %end_if_11
then_10:
  store i8* null, i8* null
  ret i8* null
unreachable_12:
  br label %end_if_11
end_if_11:
  br label %end_if_8
end_if_8:
  %53 = call i8* @malloc(i64 8)
  %54 = bitcast i8* %53 to i64*
  %55 = call i64** @new_list_String(i64 2, i64* %54)
  store i64** %55, i64*** %ptr_bindings
  %56 = load i64**, i64*** %ptr_p
  %57 = bitcast i64** %56 to i64*
  %58 = getelementptr inbounds i64, i64* %57, i64 1
  %59 = bitcast i64* %58 to i8**
  %60 = load i8*, i8** %59, align 8
  %61 = bitcast i8* %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 0
  %63 = bitcast i64* %62 to i8**
  %64 = load i8*, i8** %63, align 8
  %65 = call i1 @check_token(i8* %64, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.303, i64 0, i64 0))
  br i1 %65, label %then_13, label %end_if_14
then_13:
  %66 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %66)
  %67 = load i64**, i64*** %ptr_p
  %68 = bitcast i64** %67 to i64*
  %69 = getelementptr inbounds i64, i64* %68, i64 1
  %70 = bitcast i64* %69 to i8**
  %71 = load i8*, i8** %70, align 8
  %72 = bitcast i8* %71 to i64*
  %73 = getelementptr inbounds i64, i64* %72, i64 0
  %74 = bitcast i64* %73 to i8**
  %75 = load i8*, i8** %74, align 8
  %76 = call i1 @check_token(i8* %75, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.304, i64 0, i64 0))
  %77 = xor i1 %76, 1
  br i1 %77, label %then_15, label %end_if_16
then_15:
  %78 = load i64**, i64*** %ptr_p
  %79 = call i8* @consume_ident(i64** %78, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.305, i64 0, i64 0))
  %80 = call i32 @strcmp(i8* %79, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.306, i64 0, i64 0))
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %then_17, label %end_if_18
then_17:
  store i8* null, i8* null
  ret i8* null
unreachable_19:
  br label %end_if_18
end_if_18:
  %82 = load i64**, i64*** %ptr_bindings
  call void @list_push_String(i64** %82, i8* %79)
  br label %while_cond_20
while_cond_20:
  %83 = load i64**, i64*** %ptr_p
  %84 = bitcast i64** %83 to i64*
  %85 = getelementptr inbounds i64, i64* %84, i64 1
  %86 = bitcast i64* %85 to i8**
  %87 = load i8*, i8** %86, align 8
  %88 = bitcast i8* %87 to i64*
  %89 = getelementptr inbounds i64, i64* %88, i64 0
  %90 = bitcast i64* %89 to i8**
  %91 = load i8*, i8** %90, align 8
  %92 = call i1 @check_token(i8* %91, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.307, i64 0, i64 0))
  br i1 %92, label %while_body_21, label %while_end_22
while_body_21:
  %93 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %93)
  %94 = load i64**, i64*** %ptr_p
  %95 = bitcast i64** %94 to i64*
  %96 = getelementptr inbounds i64, i64* %95, i64 1
  %97 = bitcast i64* %96 to i8**
  %98 = load i8*, i8** %97, align 8
  %99 = bitcast i8* %98 to i64*
  %100 = getelementptr inbounds i64, i64* %99, i64 0
  %101 = bitcast i64* %100 to i8**
  %102 = load i8*, i8** %101, align 8
  %103 = call i1 @check_token(i8* %102, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.308, i64 0, i64 0))
  %104 = xor i1 %103, 1
  br i1 %104, label %then_23, label %end_if_24
then_23:
  %105 = load i64**, i64*** %ptr_p
  %106 = call i8* @consume_ident(i64** %105, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.309, i64 0, i64 0))
  store i8* %106, i8** %ptr_bn2
  %107 = load i8*, i8** %ptr_bn2
  %108 = call i32 @strcmp(i8* %107, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.310, i64 0, i64 0))
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %then_25, label %end_if_26
then_25:
  store i8* null, i8* null
  ret i8* null
unreachable_27:
  br label %end_if_26
end_if_26:
  %110 = load i64**, i64*** %ptr_bindings
  %111 = load i8*, i8** %ptr_bn2
  call void @list_push_String(i64** %110, i8* %111)
  br label %end_if_24
end_if_24:
  br label %while_cond_20
while_end_22:
  br label %end_if_16
end_if_16:
  %112 = load i64**, i64*** %ptr_p
  %113 = call i1 @consume(i64** %112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.311, i64 0, i64 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.312, i64 0, i64 0))
  br label %end_if_14
end_if_14:
  %114 = load i64**, i64*** %ptr_p
  %115 = call i1 @consume(i64** %114, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.313, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.314, i64 0, i64 0))
  %116 = load i64**, i64*** %ptr_p
  %117 = call i64** @parse_block(i64** %116)
  %118 = icmp eq i64** %117, null
  br i1 %118, label %when_none_29, label %when_val_30
when_none_29:
  store i8* null, i8* null
  ret i8* null
unreachable_31:
  br label %when_end_28
when_val_30:
  store i64** %117, i64*** %ptr_b
  %119 = call i8* @malloc(i64 24)
  %120 = bitcast i8* %119 to i64*
  %121 = bitcast i64* %120 to i64*
  %122 = getelementptr inbounds i64, i64* %121, i64 0
  %123 = bitcast i64* %122 to i8**
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.300, i64 0, i64 0), i8** %123, align 8
  %124 = load i64**, i64*** %ptr_bindings
  %125 = bitcast i64* %120 to i64*
  %126 = getelementptr inbounds i64, i64* %125, i64 1
  %127 = bitcast i64* %126 to i64***
  store i64** %124, i64*** %127, align 8
  %128 = load i64**, i64*** %ptr_b
  %129 = bitcast i64* %120 to i64*
  %130 = getelementptr inbounds i64, i64* %129, i64 2
  %131 = bitcast i64* %130 to i64***
  store i64** %128, i64*** %131, align 8
  %132 = load i64, i64* %120
  call void @list_push_WhenCase(i64** %14, i64 %132)
  br label %when_end_28
when_end_28:
  %133 = load i64**, i64*** %ptr_p
  %134 = bitcast i64** %133 to i64*
  %135 = getelementptr inbounds i64, i64* %134, i64 1
  %136 = bitcast i64* %135 to i8**
  %137 = load i8*, i8** %136, align 8
  %138 = bitcast i8* %137 to i64*
  %139 = getelementptr inbounds i64, i64* %138, i64 0
  %140 = bitcast i64* %139 to i8**
  %141 = load i8*, i8** %140, align 8
  %142 = call i1 @check_token(i8* %141, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.315, i64 0, i64 0))
  br i1 %142, label %then_32, label %end_if_33
then_32:
  %143 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %143)
  br label %end_if_33
end_if_33:
  br label %while_cond_4
while_end_6:
  %144 = load i64**, i64*** %ptr_p
  %145 = call i1 @consume(i64** %144, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.316, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.317, i64 0, i64 0))
  %146 = load i64**, i64*** %ptr_target
  %147 = icmp eq i64** %146, null
  br i1 %147, label %when_none_35, label %when_val_36
when_none_35:
  br label %when_end_34
when_val_36:
  %148 = load i64**, i64*** %ptr_target
  store i64** %148, i64*** %ptr_t
  %149 = call i8* @malloc(i64 24)
  %150 = bitcast i8* %149 to i64*
  store i64* %150, i64*** %ptr_expr
  %151 = load i64**, i64*** %ptr_expr
  %152 = load i64**, i64*** %ptr_t
  %153 = bitcast i64** %151 to i64*
  %154 = getelementptr inbounds i64, i64* %153, i64 0
  %155 = bitcast i64* %154 to i64***
  store i64** %152, i64*** %155, align 8
  %156 = load i64**, i64*** %ptr_expr
  %157 = bitcast i64** %156 to i64*
  %158 = getelementptr inbounds i64, i64* %157, i64 1
  %159 = bitcast i64* %158 to i64***
  store i64** %14, i64*** %159, align 8
  %160 = load i64**, i64*** %ptr_expr
  %161 = bitcast i64** %160 to i64*
  %162 = getelementptr inbounds i64, i64* %161, i64 2
  %163 = bitcast i64* %162 to i1*
  store i1 0, i1* %163, align 8
  %164 = load i64**, i64*** %ptr_expr
  store i64** %164, i8* null
  ret i8* null
unreachable_37:
  br label %when_end_34
when_end_34:
  store i8* null, i8* null
  ret i8* null
unreachable_38:
  ret i64** null
}

define i64** @parse_primary_expr(i64** noalias %param_p) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_p, i64*** %ptr_p
  %1 = load i64**, i64*** %ptr_p
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr inbounds i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = load i64**, i64*** %ptr_p
  %11 = bitcast i64** %10 to i64*
  %12 = getelementptr inbounds i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i8**
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = load i64**, i64*** %ptr_p
  %20 = bitcast i64** %19 to i64*
  %21 = getelementptr inbounds i64, i64* %20, i64 1
  %22 = bitcast i64* %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = bitcast i8* %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 0
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds i64, i8* %27, i64 0
  %29 = bitcast i64* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = icmp eq i64 %30, 25
  br i1 %31, label %when_case_1, label %when_next_2
when_case_1:
  %32 = getelementptr inbounds i64, i8* %27, i64 1
  %33 = bitcast i64* %32 to i8**
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %ptr_val
  %35 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %35)
  %36 = call i8* @malloc(i64 16)
  %37 = bitcast i8* %36 to i64*
  %38 = getelementptr inbounds i64, i64* %37, i64 0
  store i64 25, i64* %38
  %39 = load i8*, i8** %ptr_val
  %40 = getelementptr inbounds i64, i64* %37, i64 1
  %41 = bitcast i64* %40 to i8**
  store i8* %39, i8** %41
  store i64* %37, i8* null
  br label %when_end_0
when_next_2:
  %42 = icmp eq i64 %30, 26
  br i1 %42, label %when_case_3, label %when_next_4
when_case_3:
  %43 = getelementptr inbounds i64, i8* %27, i64 1
  %44 = bitcast i64* %43 to i8**
  %45 = load i8*, i8** %44, align 8
  store i8* %45, i8** %ptr_val
  %46 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %46)
  %47 = call i8* @malloc(i64 16)
  %48 = bitcast i8* %47 to i64*
  %49 = getelementptr inbounds i64, i64* %48, i64 0
  store i64 26, i64* %49
  %50 = load i8*, i8** %ptr_val
  %51 = getelementptr inbounds i64, i64* %48, i64 1
  %52 = bitcast i64* %51 to i8**
  store i8* %50, i8** %52
  store i64* %48, i8* null
  br label %when_end_0
when_next_4:
  %53 = icmp eq i64 %30, 27
  br i1 %53, label %when_case_5, label %when_next_6
when_case_5:
  %54 = getelementptr inbounds i64, i8* %27, i64 1
  %55 = bitcast i64* %54 to i8**
  %56 = load i8*, i8** %55, align 8
  store i8* %56, i8** %ptr_val
  %57 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %57)
  %58 = call i8* @malloc(i64 16)
  %59 = bitcast i8* %58 to i64*
  %60 = getelementptr inbounds i64, i64* %59, i64 0
  store i64 27, i64* %60
  %61 = load i8*, i8** %ptr_val
  %62 = getelementptr inbounds i64, i64* %59, i64 1
  %63 = bitcast i64* %62 to i8**
  store i8* %61, i8** %63
  store i64* %59, i8* null
  br label %when_end_0
when_next_6:
  %64 = icmp eq i64 %30, 28
  br i1 %64, label %when_case_7, label %when_next_8
when_case_7:
  %65 = getelementptr inbounds i64, i8* %27, i64 1
  %66 = bitcast i64* %65 to i8**
  %67 = load i8*, i8** %66, align 8
  store i8* %67, i8** %ptr_val
  %68 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %68)
  %69 = call i8* @malloc(i64 16)
  %70 = bitcast i8* %69 to i64*
  %71 = getelementptr inbounds i64, i64* %70, i64 0
  store i64 28, i64* %71
  %72 = load i8*, i8** %ptr_val
  %73 = getelementptr inbounds i64, i64* %70, i64 1
  %74 = bitcast i64* %73 to i8**
  store i8* %72, i8** %74
  store i64* %70, i8* null
  br label %when_end_0
when_next_8:
  %75 = icmp eq i64 %30, 29
  br i1 %75, label %when_case_9, label %when_next_10
when_case_9:
  %76 = getelementptr inbounds i64, i8* %27, i64 1
  %77 = bitcast i64* %76 to i8**
  %78 = load i8*, i8** %77, align 8
  store i8* %78, i8** %ptr_val
  %79 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %79)
  %80 = call i8* @malloc(i64 16)
  %81 = bitcast i8* %80 to i64*
  %82 = getelementptr inbounds i64, i64* %81, i64 0
  store i64 29, i64* %82
  %83 = load i8*, i8** %ptr_val
  %84 = getelementptr inbounds i64, i64* %81, i64 1
  %85 = bitcast i64* %84 to i8**
  store i8* %83, i8** %85
  store i64* %81, i8* null
  br label %when_end_0
when_next_10:
  %86 = icmp eq i64 %30, 13
  br i1 %86, label %when_case_11, label %when_next_12
when_case_11:
  %87 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %87)
  %88 = call i8* @malloc(i64 16)
  %89 = bitcast i8* %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 0
  store i64 5, i64* %90
  %91 = getelementptr inbounds i64, i64* %89, i64 1
  %92 = bitcast i64* %91 to i1*
  store i1 1, i1* %92
  store i64* %89, i8* null
  br label %when_end_0
when_next_12:
  %93 = icmp eq i64 %30, 14
  br i1 %93, label %when_case_13, label %when_next_14
when_case_13:
  %94 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %94)
  %95 = call i8* @malloc(i64 16)
  %96 = bitcast i8* %95 to i64*
  %97 = getelementptr inbounds i64, i64* %96, i64 0
  store i64 5, i64* %97
  %98 = getelementptr inbounds i64, i64* %96, i64 1
  %99 = bitcast i64* %98 to i1*
  store i1 0, i1* %99
  store i64* %96, i8* null
  br label %when_end_0
when_next_14:
  %100 = icmp eq i64 %30, 52
  br i1 %100, label %when_case_15, label %when_next_16
when_case_15:
  %101 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %101)
  %102 = call i8* @malloc(i64 8)
  %103 = bitcast i8* %102 to i64*
  %104 = getelementptr inbounds i64, i64* %103, i64 0
  store i64 52, i64* %104
  store i64* %103, i8* null
  br label %when_end_0
when_next_16:
  %105 = icmp eq i64 %30, 55
  br i1 %105, label %when_case_17, label %when_next_18
when_case_17:
  %106 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %106)
  %107 = call i64** @new_empty_expr_list()
  %108 = load i64**, i64*** %ptr_p
  %109 = bitcast i64** %108 to i64*
  %110 = getelementptr inbounds i64, i64* %109, i64 1
  %111 = bitcast i64* %110 to i8**
  %112 = load i8*, i8** %111, align 8
  %113 = bitcast i8* %112 to i64*
  %114 = getelementptr inbounds i64, i64* %113, i64 0
  %115 = bitcast i64* %114 to i8**
  %116 = load i8*, i8** %115, align 8
  %117 = call i1 @check_token(i8* %116, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.318, i64 0, i64 0))
  %118 = xor i1 %117, 1
  br i1 %118, label %then_19, label %end_if_20
then_19:
  %119 = load i64**, i64*** %ptr_p
  %120 = call i64** @parse_expression(i64** %119)
  store i64** %120, i64*** %ptr_a_opt
  %121 = load i64**, i64*** %ptr_a_opt
  %122 = icmp eq i64** %121, null
  br i1 %122, label %when_none_22, label %when_val_23
when_none_22:
  br label %when_end_21
when_val_23:
  %123 = load i64**, i64*** %ptr_a_opt
  store i64** %123, i64*** %ptr_a
  %124 = load i64**, i64*** %ptr_a
  %125 = load i64*, i64** %124
  call void @push_expr_list(i64** %107, i64* %125)
  br label %when_end_21
when_end_21:
  br label %while_cond_24
while_cond_24:
  %126 = load i64**, i64*** %ptr_p
  %127 = bitcast i64** %126 to i64*
  %128 = getelementptr inbounds i64, i64* %127, i64 1
  %129 = bitcast i64* %128 to i8**
  %130 = load i8*, i8** %129, align 8
  %131 = bitcast i8* %130 to i64*
  %132 = getelementptr inbounds i64, i64* %131, i64 0
  %133 = bitcast i64* %132 to i8**
  %134 = load i8*, i8** %133, align 8
  %135 = call i1 @check_token(i8* %134, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.319, i64 0, i64 0))
  br i1 %135, label %while_body_25, label %while_end_26
while_body_25:
  %136 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %136)
  %137 = load i64**, i64*** %ptr_p
  %138 = call i64** @parse_expression(i64** %137)
  %139 = icmp eq i64** %138, null
  br i1 %139, label %when_none_28, label %when_val_29
when_none_28:
  br label %when_end_27
when_val_29:
  %140 = load i64*, i64** %138
  call void @push_expr_list(i64** %107, i64* %140)
  br label %when_end_27
when_end_27:
  br label %while_cond_24
while_end_26:
  br label %end_if_20
end_if_20:
  %141 = load i64**, i64*** %ptr_p
  %142 = call i1 @consume(i64** %141, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.320, i64 0, i64 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.321, i64 0, i64 0))
  %143 = call i8* @malloc(i64 16)
  %144 = bitcast i8* %143 to i64*
  %145 = getelementptr inbounds i64, i64* %144, i64 0
  store i64 6, i64* %145
  %146 = getelementptr inbounds i64, i64* %144, i64 1
  %147 = bitcast i64* %146 to i64***
  store i64** %107, i64*** %147
  store i64* %144, i8* null
  br label %when_end_0
when_next_18:
  %148 = icmp eq i64 %30, 57
  br i1 %148, label %when_case_30, label %when_next_31
when_case_30:
  %149 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %149)
  %150 = load i64**, i64*** %ptr_p
  %151 = call i64** @parse_expression(i64** %150)
  store i64** %151, i64*** %ptr_inner_opt
  %152 = load i64**, i64*** %ptr_p
  %153 = call i1 @consume(i64** %152, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.322, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.323, i64 0, i64 0))
  %154 = load i64**, i64*** %ptr_inner_opt
  %155 = icmp eq i64** %154, null
  br i1 %155, label %when_none_33, label %when_val_34
when_none_33:
  br label %when_end_32
when_val_34:
  %156 = load i64**, i64*** %ptr_inner_opt
  store i64** %156, i64*** %ptr_inner
  %157 = call i8* @malloc(i64 16)
  %158 = bitcast i8* %157 to i64*
  %159 = load i64**, i64*** %ptr_inner
  %160 = load i64*, i64** %159
  store i64* %160, i64* %158
  %161 = call i8* @malloc(i64 16)
  %162 = bitcast i8* %161 to i64*
  %163 = getelementptr inbounds i64, i64* %162, i64 0
  store i64 8, i64* %163
  %164 = getelementptr inbounds i64, i64* %162, i64 1
  %165 = bitcast i64* %164 to i64**
  store i64* %158, i64** %165
  store i64* %162, i8* null
  br label %when_end_32
when_end_32:
  br label %when_end_0
when_next_31:
  %166 = icmp eq i64 %30, 8
  br i1 %166, label %when_case_35, label %when_next_36
when_case_35:
  %167 = load i64**, i64*** %ptr_p
  %168 = call i64** @parse_when_expr(i64** %167)
  store i64** %168, i64*** %ptr_when_opt
  %169 = load i64**, i64*** %ptr_when_opt
  %170 = icmp eq i64** %169, null
  br i1 %170, label %when_none_38, label %when_val_39
when_none_38:
  ret i8* null
unreachable_40:
  br label %when_end_37
when_val_39:
  %171 = load i64**, i64*** %ptr_when_opt
  store i64** %171, i64*** %ptr_w
  %172 = load i64**, i64*** %ptr_p
  %173 = bitcast i64** %172 to i64*
  %174 = getelementptr inbounds i64, i64* %173, i64 1
  %175 = bitcast i64* %174 to i8**
  %176 = load i8*, i8** %175, align 8
  %177 = bitcast i8* %176 to i64*
  %178 = getelementptr inbounds i64, i64* %177, i64 1
  %179 = bitcast i64* %178 to i64*
  %180 = load i64, i64* %179, align 8
  %181 = load i64**, i64*** %ptr_p
  %182 = bitcast i64** %181 to i64*
  %183 = getelementptr inbounds i64, i64* %182, i64 1
  %184 = bitcast i64* %183 to i8**
  %185 = load i8*, i8** %184, align 8
  %186 = bitcast i8* %185 to i64*
  %187 = getelementptr inbounds i64, i64* %186, i64 2
  %188 = bitcast i64* %187 to i64*
  %189 = load i64, i64* %188, align 8
  %190 = call i64** @alloc_span(i64 %9, i64 %18, i64 %180, i64 %189)
  store i64** %190, i64*** %ptr_span
  %191 = call i8* @malloc(i64 16)
  %192 = bitcast i8* %191 to i64*
  store i64* %192, i64*** %ptr_expr
  %193 = load i64**, i64*** %ptr_expr
  %194 = load i64**, i64*** %ptr_span
  %195 = bitcast i64** %193 to i64*
  %196 = getelementptr inbounds i64, i64* %195, i64 1
  %197 = bitcast i64* %196 to i64***
  store i64** %194, i64*** %197, align 8
  %198 = call i8* @malloc(i64 24)
  %199 = bitcast i8* %198 to i64*
  store i64* %199, i64* %158
  %200 = load i64**, i64*** %ptr_w
  %201 = load i64*, i64** %200
  store i64* %201, i64* %158
  %202 = call i8* @malloc(i64 16)
  %203 = bitcast i8* %202 to i64*
  %204 = getelementptr inbounds i64, i64* %203, i64 0
  store i64 8, i64* %204
  %205 = getelementptr inbounds i64, i64* %203, i64 1
  %206 = bitcast i64* %205 to i64**
  store i64* %158, i64** %206
  %207 = load i64**, i64*** %ptr_expr
  %208 = bitcast i64** %207 to i64*
  %209 = getelementptr inbounds i64, i64* %208, i64 0
  %210 = bitcast i64* %209 to i64**
  store i64* %203, i64** %210, align 8
  %211 = load i64**, i64*** %ptr_expr
  store i64** %211, i8* null
  ret i8* null
unreachable_41:
  br label %when_end_37
when_end_37:
  br label %when_end_0
when_next_36:
  %212 = icmp eq i64 %30, 49
  br i1 %212, label %when_case_42, label %when_next_43
when_case_42:
  %213 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %213)
  %214 = load i64**, i64*** %ptr_p
  %215 = call i64** @parse_type(i64** %214)
  %216 = icmp eq i64** %215, null
  br i1 %216, label %when_none_45, label %when_val_46
when_none_45:
  %217 = load i64**, i64*** %ptr_p
  %218 = bitcast i64** %217 to i64*
  %219 = getelementptr inbounds i64, i64* %218, i64 1
  %220 = bitcast i64* %219 to i8**
  %221 = load i8*, i8** %220, align 8
  %222 = bitcast i8* %221 to i64*
  %223 = getelementptr inbounds i64, i64* %222, i64 1
  %224 = bitcast i64* %223 to i64*
  %225 = load i64, i64* %224, align 8
  %226 = load i64**, i64*** %ptr_p
  %227 = bitcast i64** %226 to i64*
  %228 = getelementptr inbounds i64, i64* %227, i64 1
  %229 = bitcast i64* %228 to i8**
  %230 = load i8*, i8** %229, align 8
  %231 = bitcast i8* %230 to i64*
  %232 = getelementptr inbounds i64, i64* %231, i64 2
  %233 = bitcast i64* %232 to i64*
  %234 = load i64, i64* %233, align 8
  %235 = call i64** @alloc_span(i64 %9, i64 %18, i64 %225, i64 %234)
  store i64** %235, i64*** %ptr_span
  %236 = load i64**, i64*** %ptr_p
  %237 = load i64**, i64*** %ptr_span
  call void @report_error(i64** %236, i64** %237, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.324, i64 0, i64 0))
  store i8* null, i8* null
  ret i8* null
unreachable_47:
  br label %when_end_44
when_val_46:
  %238 = call i64** @new_empty_expr_list()
  store i64** %238, i64** %107
  %239 = load i64**, i64*** %ptr_p
  %240 = bitcast i64** %239 to i64*
  %241 = getelementptr inbounds i64, i64* %240, i64 1
  %242 = bitcast i64* %241 to i8**
  %243 = load i8*, i8** %242, align 8
  %244 = bitcast i8* %243 to i64*
  %245 = getelementptr inbounds i64, i64* %244, i64 0
  %246 = bitcast i64* %245 to i8**
  %247 = load i8*, i8** %246, align 8
  %248 = call i1 @check_token(i8* %247, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.325, i64 0, i64 0))
  br i1 %248, label %then_48, label %else_50
then_48:
  %249 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %249)
  %250 = load i64**, i64*** %ptr_p
  %251 = bitcast i64** %250 to i64*
  %252 = getelementptr inbounds i64, i64* %251, i64 1
  %253 = bitcast i64* %252 to i8**
  %254 = load i8*, i8** %253, align 8
  %255 = bitcast i8* %254 to i64*
  %256 = getelementptr inbounds i64, i64* %255, i64 0
  %257 = bitcast i64* %256 to i8**
  %258 = load i8*, i8** %257, align 8
  %259 = call i1 @check_token(i8* %258, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.326, i64 0, i64 0))
  %260 = xor i1 %259, 1
  br i1 %260, label %then_51, label %end_if_52
then_51:
  %261 = load i64**, i64*** %ptr_p
  %262 = call i64** @parse_expression(i64** %261)
  store i64** %262, i64*** %ptr_a_opt
  %263 = load i64**, i64*** %ptr_a_opt
  %264 = icmp eq i64** %263, null
  br i1 %264, label %when_none_54, label %when_val_55
when_none_54:
  br label %when_end_53
when_val_55:
  %265 = load i64**, i64*** %ptr_a_opt
  store i64** %265, i64*** %ptr_a
  %266 = load i64**, i64*** %ptr_a
  %267 = load i64*, i64** %266
  call void @push_expr_list(i64** %107, i64* %267)
  br label %when_end_53
when_end_53:
  br label %while_cond_56
while_cond_56:
  %268 = load i64**, i64*** %ptr_p
  %269 = bitcast i64** %268 to i64*
  %270 = getelementptr inbounds i64, i64* %269, i64 1
  %271 = bitcast i64* %270 to i8**
  %272 = load i8*, i8** %271, align 8
  %273 = bitcast i8* %272 to i64*
  %274 = getelementptr inbounds i64, i64* %273, i64 0
  %275 = bitcast i64* %274 to i8**
  %276 = load i8*, i8** %275, align 8
  %277 = call i1 @check_token(i8* %276, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.327, i64 0, i64 0))
  br i1 %277, label %while_body_57, label %while_end_58
while_body_57:
  %278 = load i64**, i64*** %ptr_p
  call void @advance_parser(i64** %278)
  %279 = load i64**, i64*** %ptr_p
  %280 = call i64** @parse_expression(i64** %279)
  store i64** %280, i64** %138
  %281 = icmp eq i64** %138, null
  br i1 %281, label %when_none_60, label %when_val_61
when_none_60:
  br label %when_end_59
when_val_61:
  store i64** %138, i64** %138
  %282 = load i64*, i64** %138
  call void @push_expr_list(i64** %107, i64* %282)
  br label %when_end_59
when_end_59:
  br label %while_cond_56
while_end_58:
  br label %end_if_52
end_if_52:
  %283 = load i64**, i64*** %ptr_p
  %284 = bitcast i64** %283 to i64*
  %285 = getelementptr inbounds i64, i64* %284, i64 1
  %286 = bitcast i64* %285 to i8**
  %287 = load i8*, i8** %286, align 8
  %288 = bitcast i8* %287 to i64*
  %289 = getelementptr inbounds i64, i64* %288, i64 1
  %290 = bitcast i64* %289 to i64*
  %291 = load i64, i64* %290, align 8
  %292 = load i64**, i64*** %ptr_p
  %293 = bitcast i64** %292 to i64*
  %294 = getelementptr inbounds i64, i64* %293, i64 1
  %295 = bitcast i64* %294 to i8**
  %296 = load i8*, i8** %295, align 8
  %297 = bitcast i8* %296 to i64*
  %298 = getelementptr inbounds i64, i64* %297, i64 2
  %299 = bitcast i64* %298 to i64*
  %300 = load i64, i64* %299, align 8
  %301 = load i64**, i64*** %ptr_p
  %302 = call i1 @consume(i64** %301, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.328, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.329, i64 0, i64 0))
  br label %end_if_49
else_50:
  %303 = bitcast i64** %215 to i64*
  %304 = getelementptr inbounds i64, i64* %303, i64 1
  %305 = bitcast i64* %304 to i8**
  %306 = load i8*, i8** %305, align 8
  %307 = bitcast i8* %306 to i64*
  %308 = getelementptr inbounds i64, i64* %307, i64 2
  %309 = bitcast i64* %308 to i64*
  %310 = load i64, i64* %309, align 8
  store i64 %310, i64 %291
  %311 = bitcast i64** %215 to i64*
  %312 = getelementptr inbounds i64, i64* %311, i64 1
  %313 = bitcast i64* %312 to i8**
  %314 = load i8*, i8** %313, align 8
  %315 = bitcast i8* %314 to i64*
  %316 = getelementptr inbounds i64, i64* %315, i64 3
  %317 = bitcast i64* %316 to i64*
  %318 = load i64, i64* %317, align 8
  store i64 %318, i64 %300
  br label %end_if_49
end_if_49:
  %319 = call i64** @alloc_span(i64 %9, i64 %18, i64 %291, i64 %300)
  store i64** %319, i64*** %ptr_span
  %320 = call i8* @malloc(i64 16)
  %321 = bitcast i8* %320 to i64*
  store i64* %321, i64*** %ptr_alloc_ex
  %322 = load i64**, i64*** %ptr_alloc_ex
  %323 = bitcast i64** %322 to i64*
  %324 = getelementptr inbounds i64, i64* %323, i64 0
  %325 = bitcast i64* %324 to i64***
  store i64** %215, i64*** %325, align 8
  %326 = load i64**, i64*** %ptr_alloc_ex
  %327 = bitcast i64** %326 to i64*
  %328 = getelementptr inbounds i64, i64* %327, i64 1
  %329 = bitcast i64* %328 to i64***
  store i64** %107, i64*** %329, align 8
  %330 = call i8* @malloc(i64 16)
  %331 = bitcast i8* %330 to i64*
  store i64* %331, i64*** %ptr_expr
  %332 = load i64**, i64*** %ptr_expr
  %333 = load i64**, i64*** %ptr_span
  %334 = bitcast i64** %332 to i64*
  %335 = getelementptr inbounds i64, i64* %334, i64 1
  %336 = bitcast i64* %335 to i64***
  store i64** %333, i64*** %336, align 8
  %337 = call i8* @malloc(i64 16)
  %338 = bitcast i8* %337 to i64*
  store i64* %338, i64* %158
  %339 = load i64**, i64*** %ptr_alloc_ex
  %340 = load i64*, i64** %339
  store i64* %340, i64* %158
  %341 = call i8* @malloc(i64 16)
  %342 = bitcast i8* %341 to i64*
  %343 = getelementptr inbounds i64, i64* %342, i64 0
  store i64 49, i64* %343
  %344 = getelementptr inbounds i64, i64* %342, i64 1
  %345 = bitcast i64* %344 to i64**
  store i64* %158, i64** %345
  %346 = load i64**, i64*** %ptr_expr
  %347 = bitcast i64** %346 to i64*
  %348 = getelementptr inbounds i64, i64* %347, i64 0
  %349 = bitcast i64* %348 to i64**
  store i64* %342, i64** %349, align 8
  %350 = load i64**, i64*** %ptr_expr
  store i64** %350, i8* null
  ret i8* null
unreachable_62:
  br label %when_end_44
when_end_44:
  br label %when_end_0
when_next_43:
  %351 = icmp eq i64 %30, 0
  br i1 %351, label %when_case_63, label %when_next_64
when_case_63:
  br label %when_end_0
when_next_64:
  %352 = icmp eq i64 %30, 1
  br i1 %352, label %when_case_65, label %when_next_66
when_case_65:
  br label %when_end_0
when_next_66:
  %353 = icmp eq i64 %30, 2
  br i1 %353, label %when_case_67, label %when_next_68
when_case_67:
  br label %when_end_0
when_next_68:
  %354 = icmp eq i64 %30, 3
  br i1 %354, label %when_case_69, label %when_next_70
when_case_69:
  br label %when_end_0
when_next_70:
  %355 = icmp eq i64 %30, 4
  br i1 %355, label %when_case_71, label %when_next_72
when_case_71:
  br label %when_end_0
when_next_72:
  %356 = icmp eq i64 %30, 5
  br i1 %356, label %when_case_73, label %when_next_74
when_case_73:
  br label %when_end_0
when_next_74:
  %357 = icmp eq i64 %30, 6
  br i1 %357, label %when_case_75, label %when_next_76
when_case_75:
  br label %when_end_0
when_next_76:
  %358 = icmp eq i64 %30, 7
  br i1 %358, label %when_case_77, label %when_next_78
when_case_77:
  br label %when_end_0
when_next_78:
  %359 = icmp eq i64 %30, 9
  br i1 %359, label %when_case_79, label %when_next_80
when_case_79:
  br label %when_end_0
when_next_80:
  %360 = icmp eq i64 %30, 10
  br i1 %360, label %when_case_81, label %when_next_82
when_case_81:
  br label %when_end_0
when_next_82:
  %361 = icmp eq i64 %30, 11
  br i1 %361, label %when_case_83, label %when_next_84
when_case_83:
  br label %when_end_0
when_next_84:
  %362 = icmp eq i64 %30, 12
  br i1 %362, label %when_case_85, label %when_next_86
when_case_85:
  br label %when_end_0
when_next_86:
  %363 = icmp eq i64 %30, 15
  br i1 %363, label %when_case_87, label %when_next_88
when_case_87:
  br label %when_end_0
when_next_88:
  %364 = icmp eq i64 %30, 16
  br i1 %364, label %when_case_89, label %when_next_90
when_case_89:
  br label %when_end_0
when_next_90:
  %365 = icmp eq i64 %30, 17
  br i1 %365, label %when_case_91, label %when_next_92
when_case_91:
  br label %when_end_0
when_next_92:
  %366 = icmp eq i64 %30, 18
  br i1 %366, label %when_case_93, label %when_next_94
when_case_93:
  br label %when_end_0
when_next_94:
  %367 = icmp eq i64 %30, 19
  br i1 %367, label %when_case_95, label %when_next_96
when_case_95:
  br label %when_end_0
when_next_96:
  %368 = icmp eq i64 %30, 20
  br i1 %368, label %when_case_97, label %when_next_98
when_case_97:
  br label %when_end_0
when_next_98:
  %369 = icmp eq i64 %30, 21
  br i1 %369, label %when_case_99, label %when_next_100
when_case_99:
  br label %when_end_0
when_next_100:
  %370 = icmp eq i64 %30, 22
  br i1 %370, label %when_case_101, label %when_next_102
when_case_101:
  br label %when_end_0
when_next_102:
  %371 = icmp eq i64 %30, 23
  br i1 %371, label %when_case_103, label %when_next_104
when_case_103:
  br label %when_end_0
when_next_104:
  %372 = icmp eq i64 %30, 24
  br i1 %372, label %when_case_105, label %when_next_106
when_case_105:
  br label %when_end_0
when_next_106:
  %373 = icmp eq i64 %30, 30
  br i1 %373, label %when_case_107, label %when_next_108
when_case_107:
  br label %when_end_0
when_next_108:
  %374 = icmp eq i64 %30, 31
  br i1 %374, label %when_case_109, label %when_next_110
when_case_109:
  br label %when_end_0
when_next_110:
  %375 = icmp eq i64 %30, 32
  br i1 %375, label %when_case_111, label %when_next_112
when_case_111:
  br label %when_end_0
when_next_112:
  %376 = icmp eq i64 %30, 33
  br i1 %376, label %when_case_113, label %when_next_114
when_case_113:
  br label %when_end_0
when_next_114:
  %377 = icmp eq i64 %30, 34
  br i1 %377, label %when_case_115, label %when_next_116
when_case_115:
  br label %when_end_0
when_next_116:
  %378 = icmp eq i64 %30, 35
  br i1 %378, label %when_case_117, label %when_next_118
when_case_117:
  br label %when_end_0
when_next_118:
  %379 = icmp eq i64 %30, 36
  br i1 %379, label %when_case_119, label %when_next_120
when_case_119:
  br label %when_end_0
when_next_120:
  %380 = icmp eq i64 %30, 37
  br i1 %380, label %when_case_121, label %when_next_122
when_case_121:
  br label %when_end_0
when_next_122:
  %381 = icmp eq i64 %30, 38
  br i1 %381, label %when_case_123, label %when_next_124
when_case_123:
  br label %when_end_0
when_next_124:
  %382 = icmp eq i64 %30, 39
  br i1 %382, label %when_case_125, label %when_next_126
when_case_125:
  br label %when_end_0
when_next_126:
  %383 = icmp eq i64 %30, 40
  br i1 %383, label %when_case_127, label %when_next_128
when_case_127:
  br label %when_end_0
when_next_128:
  %384 = icmp eq i64 %30, 41
  br i1 %384, label %when_case_129, label %when_next_130
when_case_129:
  br label %when_end_0
when_next_130:
  %385 = icmp eq i64 %30, 42
  br i1 %385, label %when_case_131, label %when_next_132
when_case_131:
  br label %when_end_0
when_next_132:
  %386 = icmp eq i64 %30, 43
  br i1 %386, label %when_case_133, label %when_next_134
when_case_133:
  br label %when_end_0
when_next_134:
  %387 = icmp eq i64 %30, 44
  br i1 %387, label %when_case_135, label %when_next_136
when_case_135:
  br label %when_end_0
when_next_136:
  %388 = icmp eq i64 %30, 45
  br i1 %388, label %when_case_137, label %when_next_138
when_case_137:
  br label %when_end_0
when_next_138:
  %389 = icmp eq i64 %30, 46
  br i1 %389, label %when_case_139, label %when_next_140
when_case_139:
  br label %when_end_0
when_next_140:
  %390 = icmp eq i64 %30, 47
  br i1 %390, label %when_case_141, label %when_next_142
when_case_141:
  br label %when_end_0
when_next_142:
  %391 = icmp eq i64 %30, 48
  br i1 %391, label %when_case_143, label %when_next_144
when_case_143:
  br label %when_end_0
when_next_144:
  %392 = icmp eq i64 %30, 51
  br i1 %392, label %when_case_145, label %when_next_146
when_case_145:
  br label %when_end_0
when_next_146:
  %393 = icmp eq i64 %30, 50
  br i1 %393, label %when_case_147, label %when_next_148
when_case_147:
  br label %when_end_0
when_next_148:
  %394 = icmp eq i64 %30, 53
  br i1 %394, label %when_case_149, label %when_next_150
when_case_149:
  br label %when_end_0
when_next_150:
  %395 = icmp eq i64 %30, 54
  br i1 %395, label %when_case_151, label %when_next_152
when_case_151:
  br label %when_end_0
when_next_152:
  %396 = icmp eq i64 %30, 59
  br i1 %396, label %when_case_153, label %when_next_154
when_case_153:
  br label %when_end_0
when_next_154:
  %397 = icmp eq i64 %30, 60
  br i1 %397, label %when_case_155, label %when_next_156
when_case_155:
  br label %when_end_0
when_next_156:
  %398 = icmp eq i64 %30, 61
  br i1 %398, label %when_case_157, label %when_next_158
when_case_157:
  br label %when_end_0
when_next_158:
  %399 = icmp eq i64 %30, 62
  br i1 %399, label %when_case_159, label %when_next_160
when_case_159:
  br label %when_end_0
when_next_160:
  %400 = icmp eq i64 %30, 63
  br i1 %400, label %when_case_161, label %when_next_162
when_case_161:
  br label %when_end_0
when_next_162:
  %401 = icmp eq i64 %30, 64
  br i1 %401, label %when_case_163, label %when_next_164
when_case_163:
  br label %when_end_0
when_next_164:
  %402 = icmp eq i64 %30, 58
  br i1 %402, label %when_case_165, label %when_next_166
when_case_165:
  br label %when_end_0
when_next_166:
  %403 = icmp eq i64 %30, 56
  br i1 %403, label %when_case_167, label %when_next_168
when_case_167:
  br label %when_end_0
when_next_168:
  br label %when_end_0
when_end_0:
  %404 = icmp eq i8* null, null
  br i1 %404, label %when_none_170, label %when_val_171
when_none_170:
  %405 = load i64**, i64*** %ptr_p
  %406 = bitcast i64** %405 to i64*
  %407 = getelementptr inbounds i64, i64* %406, i64 1
  %408 = bitcast i64* %407 to i8**
  %409 = load i8*, i8** %408, align 8
  %410 = bitcast i8* %409 to i64*
  %411 = getelementptr inbounds i64, i64* %410, i64 1
  %412 = bitcast i64* %411 to i64*
  %413 = load i64, i64* %412, align 8
  %414 = load i64**, i64*** %ptr_p
  %415 = bitcast i64** %414 to i64*
  %416 = getelementptr inbounds i64, i64* %415, i64 1
  %417 = bitcast i64* %416 to i8**
  %418 = load i8*, i8** %417, align 8
  %419 = bitcast i8* %418 to i64*
  %420 = getelementptr inbounds i64, i64* %419, i64 2
  %421 = bitcast i64* %420 to i64*
  %422 = load i64, i64* %421, align 8
  %423 = call i64** @alloc_span(i64 %9, i64 %18, i64 %413, i64 %422)
  store i64** %423, i64*** %ptr_span
  %424 = load i64**, i64*** %ptr_p
  %425 = load i64**, i64*** %ptr_span
  call void @report_error(i64** %424, i64** %425, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.330, i64 0, i64 0))
  store i8* null, i8* null
  ret i8* null
unreachable_172:
  br label %when_end_169
when_val_171:
  store i8* null, i64** %ptr_prim
  %426 = load i64**, i64*** %ptr_p
  %427 = bitcast i64** %426 to i64*
  %428 = getelementptr inbounds i64, i64* %427, i64 1
  %429 = bitcast i64* %428 to i8**
  %430 = load i8*, i8** %429, align 8
  %431 = bitcast i8* %430 to i64*
  %432 = getelementptr inbounds i64, i64* %431, i64 1
  %433 = bitcast i64* %432 to i64*
  %434 = load i64, i64* %433, align 8
  %435 = load i64**, i64*** %ptr_p
  %436 = bitcast i64** %435 to i64*
  %437 = getelementptr inbounds i64, i64* %436, i64 1
  %438 = bitcast i64* %437 to i8**
  %439 = load i8*, i8** %438, align 8
  %440 = bitcast i8* %439 to i64*
  %441 = getelementptr inbounds i64, i64* %440, i64 2
  %442 = bitcast i64* %441 to i64*
  %443 = load i64, i64* %442, align 8
  %444 = call i64** @alloc_span(i64 %9, i64 %18, i64 %434, i64 %443)
  store i64** %444, i64*** %ptr_span
  %445 = call i8* @malloc(i64 16)
  %446 = bitcast i8* %445 to i64*
  store i64* %446, i64*** %ptr_expr
  %447 = load i64**, i64*** %ptr_expr
  %448 = load i64**, i64*** %ptr_span
  %449 = bitcast i64** %447 to i64*
  %450 = getelementptr inbounds i64, i64* %449, i64 1
  %451 = bitcast i64* %450 to i64***
  store i64** %448, i64*** %451, align 8
  %452 = call i8* @malloc(i64 8)
  %453 = bitcast i8* %452 to i64*
  store i64* %453, i64* %158
  %454 = load i64*, i64** %ptr_prim
  store i64* %454, i64* %158
  %455 = call i8* @malloc(i64 16)
  %456 = bitcast i8* %455 to i64*
  %457 = getelementptr inbounds i64, i64* %456, i64 0
  store i64 16, i64* %457
  %458 = getelementptr inbounds i64, i64* %456, i64 1
  %459 = bitcast i64* %458 to i64**
  store i64* %158, i64** %459
  %460 = load i64**, i64*** %ptr_expr
  %461 = bitcast i64** %460 to i64*
  %462 = getelementptr inbounds i64, i64* %461, i64 0
  %463 = bitcast i64* %462 to i64**
  store i64* %456, i64** %463, align 8
  %464 = load i64**, i64*** %ptr_expr
  store i64** %464, i8* null
  ret i8* null
unreachable_173:
  br label %when_end_169
when_end_169:
  ret i64** null
}

define i64** @new_list_Spanned_Expression(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_Spanned_Expression(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define i64** @new_list_String(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_String(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define i64** @new_list_Spanned_Type(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define i64** @new_list_Spanned_Statement(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_Spanned_Statement(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define i64** @new_list_Param(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_Param(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define i64** @new_list_FieldDecl(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_FieldDecl(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define i64** @new_list_VariantDecl(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_Spanned_Type(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define void @list_push_VariantDecl(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define i64** @new_list_Spanned_ImportDirective(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define i64** @new_list_Spanned_Declaration(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_Spanned_ImportDirective(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define void @list_push_Spanned_Declaration(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

define i64** @new_list_WhenCase(i64 %param_capacity, i64** noalias %param_dummy) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64 %param_capacity, i64* %ptr_capacity
  store i64** %param_dummy, i64*** %ptr_dummy
  %1 = call i8* @malloc(i64 24)
  %2 = bitcast i8* %1 to i64*
  store i64* %2, i64*** %ptr_list
  %3 = load i64**, i64*** %ptr_list
  %4 = load i64, i64* %ptr_capacity
  %5 = bitcast i64** %3 to i64*
  %6 = getelementptr inbounds i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i64*
  store i64 %4, i64* %7, align 8
  %8 = load i64**, i64*** %ptr_list
  %9 = bitcast i64** %8 to i64*
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i64*
  store i64 0, i64* %11, align 8
  %12 = load i64, i64* %ptr_capacity
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %then_0, label %end_if_1
then_0:
  %14 = load i64**, i64*** %ptr_list
  %15 = bitcast i64** %14 to i64*
  %16 = getelementptr inbounds i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i64, i64* %ptr_capacity
  %20 = mul nsw i64 %19, 8
  %21 = call i8* @malloc(i64 %20)
  %22 = bitcast i8* %21 to i64*
  %23 = load i64**, i64*** %ptr_list
  %24 = bitcast i64** %23 to i64*
  %25 = getelementptr inbounds i64, i64* %24, i64 2
  %26 = bitcast i64* %25 to i8**
  %27 = load i8*, i8** %26, align 8
  %28 = load i64, i64* %ptr_capacity
  %29 = mul nsw i64 %28, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 2
  %35 = bitcast i64* %34 to i64**
  store i64* %31, i64** %35, align 8
  br label %end_if_1
end_if_1:
  %36 = load i64**, i64*** %ptr_list
  ret i64** %36
unreachable_2:
  ret i64** null
}

define void @list_push_WhenCase(i64** noalias %param_list, i64* noalias %param_item) {
entry:
  %shared_vec_idx = alloca i64
  %ptr_left = alloca i64**
  %ptr_dummy = alloca i64**
  %ptr_condition_opt = alloca i64**
  %ptr_ptr = alloca i64
  %ptr_s = alloca i64
  %ptr_message = alloca i8*
  %ptr_str_val = alloca i8*
  %ptr_condition = alloca i64**
  %ptr_block_opt = alloca i64**
  %ptr_ident = alloca i8*
  %ptr_esc = alloca i64
  %ptr_l = alloca i64**
  %ptr_fields = alloca i64**
  %ptr_c_expr = alloca i64**
  %ptr_old_item = alloca i64*
  %ptr_col = alloca i64
  %ptr_source = alloca i8*
  %ptr_prim = alloca i64*
  %ptr_fractional_mult = alloca double
  %ptr_val = alloca i8*
  %ptr_val_int = alloca i64
  %ptr_tok = alloca i64**
  %ptr_statements = alloca i64**
  %ptr_err = alloca i64**
  %ptr_blk_ptr = alloca i64**
  %ptr_then_block = alloca i64**
  %ptr_stmt = alloca i64**
  %ptr_vdecl = alloca i64**
  %ptr_a_opt = alloca i64**
  %ptr_inner_opt = alloca i64**
  %ptr_val_float = alloca double
  %ptr_e = alloca i64**
  %ptr_c = alloca i64**
  %ptr_dummy_import = alloca i64**
  %ptr_kind = alloca i64*
  %ptr_call = alloca i64**
  %ptr_value = alloca i64**
  %ptr_msg = alloca i8*
  %ptr_capacity = alloca i64
  %ptr_src = alloca i8*
  %ptr_offset = alloca i64
  %ptr_matched = alloca i1
  %ptr_field = alloca i64**
  %ptr_span = alloca i64**
  %ptr_idx_expr = alloca i64**
  %ptr_item = alloca i64*
  %ptr_body = alloca i64**
  %ptr_init = alloca i64**
  %ptr_pr = alloca i64**
  %ptr_s2 = alloca i64
  %ptr_path = alloca i64**
  %ptr_target_opt = alloca i64**
  %ptr_associated_types = alloca i64**
  %ptr_digit_val = alloca i64
  %ptr_bn2 = alloca i8*
  %ptr_data_opt = alloca i64**
  %ptr_s1 = alloca i64
  %ptr_start_expr = alloca i64**
  %ptr_t = alloca i64**
  %ptr_r = alloca i64**
  %ptr_start_pos = alloca i64
  %ptr_is_float = alloca i1
  %ptr_dummy_field = alloca i64**
  %ptr_variants = alloca i64**
  %ptr_ei = alloca i64**
  %ptr_end_pos = alloca i64
  %ptr_prog = alloca i64**
  %ptr_imp = alloca i64**
  %ptr_operand = alloca i64**
  %ptr_is_nullable = alloca i1
  %ptr_w = alloca i64**
  %ptr_is_slice = alloca i1
  %ptr_left_opt = alloca i64**
  %ptr_assign = alloca i64**
  %ptr_parsing = alloca i1
  %ptr_slice = alloca i64**
  %ptr_bindings = alloca i64**
  %ptr_eb = alloca i64**
  %ptr_d = alloca i64**
  %ptr_p = alloca i64**
  %ptr_alloc_ex = alloca i64**
  %ptr_is_mut = alloca i1
  %ptr_char_val = alloca i64
  %ptr_b = alloca i64**
  %ptr_right = alloca i64**
  %ptr_is_ptr = alloca i1
  %ptr_lex = alloca i64**
  %ptr_val_opt = alloca i64**
  %ptr_t2 = alloca i64**
  %ptr_idx = alloca i64**
  %ptr_then_block_opt = alloca i64**
  %ptr_new_buffer = alloca i64**
  %ptr_is_assign = alloca i1
  %ptr_f = alloca i64**
  %ptr_first_name = alloca i8*
  %ptr_dummy_case = alloca i64**
  %ptr_v = alloca i64**
  %ptr_list = alloca i64**
  %ptr_next_c = alloca i64
  %ptr_g = alloca i64**
  %ptr_target_type = alloca i64**
  %ptr_target = alloca i64**
  %ptr_line = alloca i64
  %ptr_inner = alloca i64**
  %ptr_when_opt = alloca i64**
  %ptr_expr = alloca i64**
  %ptr_a = alloca i64**
  %ptr_arg = alloca i64**
  store i64** %param_list, i64*** %ptr_list
  store i64* %param_item, i64** %ptr_item
  %1 = load i64**, i64*** %ptr_list
  %2 = bitcast i64** %1 to i64*
  %3 = getelementptr inbounds i64, i64* %2, i64 1
  %4 = bitcast i64* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = load i64**, i64*** %ptr_list
  %7 = bitcast i64** %6 to i64*
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = icmp eq i64 %5, %10
  br i1 %11, label %then_0, label %end_if_1
then_0:
  %12 = load i64**, i64*** %ptr_list
  %13 = bitcast i64** %12 to i64*
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = bitcast i64* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = mul nsw i64 %16, 2
  %18 = load i64**, i64*** %ptr_list
  %19 = bitcast i64** %18 to i64*
  %20 = getelementptr inbounds i64, i64* %19, i64 0
  %21 = bitcast i64* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %then_2, label %end_if_3
then_2:
  store i64 8, i64 %17
  br label %end_if_3
end_if_3:
  %24 = load i64**, i64*** %ptr_list
  %25 = bitcast i64** %24 to i64*
  %26 = getelementptr inbounds i64, i64* %25, i64 2
  %27 = bitcast i64* %26 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = mul nsw i64 %17, 8
  %30 = call i8* @malloc(i64 %29)
  %31 = bitcast i8* %30 to i64*
  store i64* %31, i64*** %ptr_new_buffer
  br label %while_cond_4
while_cond_4:
  %32 = load i64**, i64*** %ptr_list
  %33 = bitcast i64** %32 to i64*
  %34 = getelementptr inbounds i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 0, %36
  br i1 %37, label %while_body_5, label %while_end_6
while_body_5:
  %38 = load i64**, i64*** %ptr_list
  %39 = bitcast i64** %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8**
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i64, i8* %42, i64 0
  %44 = load i64, i64* %43
  store i64 %44, i64** %ptr_old_item
  %45 = load i64**, i64*** %ptr_new_buffer
  %46 = load i64*, i64** %ptr_old_item
  %47 = getelementptr inbounds i64, i64** %45, i64 0
  store i64* %46, i64* %47
  %48 = add nsw i64 0, 1
  store i64 %48, i64 0
  br label %while_cond_4
while_end_6:
  %49 = load i64**, i64*** %ptr_list
  %50 = bitcast i64** %49 to i64*
  %51 = getelementptr inbounds i64, i64* %50, i64 0
  %52 = bitcast i64* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %then_7, label %end_if_8
then_7:
  %55 = load i64**, i64*** %ptr_list
  %56 = bitcast i64** %55 to i64*
  %57 = getelementptr inbounds i64, i64* %56, i64 2
  %58 = bitcast i64* %57 to i8**
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i8*
  call void @free(i8* %60)
  br label %end_if_8
end_if_8:
  %61 = load i64**, i64*** %ptr_list
  %62 = load i64**, i64*** %ptr_new_buffer
  %63 = bitcast i64** %61 to i64*
  %64 = getelementptr inbounds i64, i64* %63, i64 2
  %65 = bitcast i64* %64 to i64***
  store i64** %62, i64*** %65, align 8
  %66 = load i64**, i64*** %ptr_list
  %67 = bitcast i64** %66 to i64*
  %68 = getelementptr inbounds i64, i64* %67, i64 0
  %69 = bitcast i64* %68 to i64*
  store i64 %17, i64* %69, align 8
  br label %end_if_1
end_if_1:
  %70 = load i64**, i64*** %ptr_list
  %71 = bitcast i64** %70 to i64*
  %72 = getelementptr inbounds i64, i64* %71, i64 2
  %73 = bitcast i64* %72 to i8**
  %74 = load i8*, i8** %73, align 8
  %75 = load i64**, i64*** %ptr_list
  %76 = bitcast i64** %75 to i64*
  %77 = getelementptr inbounds i64, i64* %76, i64 1
  %78 = bitcast i64* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = load i64*, i64** %ptr_item
  %81 = getelementptr inbounds i64, i8* %74, i64 %79
  store i64* %80, i64* %81
  %82 = load i64**, i64*** %ptr_list
  %83 = bitcast i64** %82 to i64*
  %84 = getelementptr inbounds i64, i64* %83, i64 1
  %85 = bitcast i64* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %86, 1
  %88 = load i64**, i64*** %ptr_list
  %89 = bitcast i64** %88 to i64*
  %90 = getelementptr inbounds i64, i64* %89, i64 1
  %91 = bitcast i64* %90 to i64*
  store i64 %87, i64* %91, align 8
  ret void
}

