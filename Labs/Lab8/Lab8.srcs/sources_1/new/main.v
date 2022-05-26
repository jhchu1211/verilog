`timescale 1ns / 1ps

module main( input clock, input reset, input playSound, output reg audioOut, output wire aud_sd);
reg [19:0] counter;
reg [31:0] time1, noteTime;
reg [9:0] msec, number; //millisecond counter, and sequence number of musical note.
wire [4:0] note, duration;
wire [19:0] notePeriod;
parameter clockFrequency = 100_000_000; 
assign aud_sd = 1'b1;
MusicSheet  mysong(number, notePeriod, duration );
always @ (posedge clock)   
begin
if(reset | ~playSound)             
begin           
counter <=0;            
time1<=0;            
number <=0;            
audioOut <=1;      
end
else 
begin
counter <= counter + 1; 
time1<= time1+1;
if( counter >= notePeriod)    
begin
counter <=0;  
audioOut <= ~audioOut ;    
end      //toggle audio output 
if( time1 >= noteTime) 
begin
time1 <=0; 
number <= number + 1; 
end  //play next note
if(number == 322) 
number <=0; // Make the number reset at the end of the song
end  
end  
always @(duration) 
noteTime = duration * clockFrequency / 8;        //number of   FPGA clock periods in one note. 4 or 8
endmodule


module MusicSheet( input [9:0] number, output reg [19:0] note,//max ? different musical notes
output reg [4:0] duration);
parameter   QUARTER = 5'b00001;//2
parameter   HALF = 5'b00010;
parameter   ONE = 2* HALF;
parameter   TWO = 2* ONE;
parameter   FOUR = 2* TWO;
parameter   C4=50_000_000/523.25, 
            E4 =50_000_000/659.25, 
            Fs4=50_000_000/739.99, Gb4 = Fs4,
            G4 = 50_000_000/783.99,
            Gs4=50_000_000/830.61, Ab4 = Gs4,
            A4=50_000_000/(2*440),
            As4=50_000_000/(466.16*2), Bb4 = As4,
            B4=50_000_000/(2*493.88),
            C5 = 50_000_000/(2*523.25), 
            D5 = 50_000_000/(2*587.33),
            Ds5 = 50_000_000/(2*622.25), Eb5 = Ds5,
            E5 = 50_000_000/(659.25*2),
            F5 = 50_000_000/(698.46*2),
            Fs5 = 50_000_000/(739.99*2), Gb5 = Fs5,
            G5 = 50_000_000/(2*783.99),
            A5 = 50_000_000/(2*2*440),
            C6 = 50_000_000/(2*2*523.25), 
            SP = 1;  

always @ (number) 
begin
case(number) //Row Row Row your boat
0:    begin note = E5;  duration = QUARTER;  end   //row
1:    begin note = SP;  duration = QUARTER;   end   //
2:    begin note = E5;  duration = QUARTER;   end   //row
3:    begin note = SP;  duration = QUARTER;  end   //
4:    begin note = E5; duration = QUARTER;   end   //row
5:    begin note = SP; duration = QUARTER;   end   //
6:    begin note = C5; duration = QUARTER;   end   //your
7:    begin note = SP; duration = QUARTER;   end   //boat
8:    begin note = E5; duration = QUARTER;   end   //
9:    begin note = SP; duration = QUARTER;   end   //gently
10:   begin note = G5; duration = QUARTER;   end   //
11:   begin note = SP; duration = QUARTER;   end   //down
12:   begin note = G4; duration = QUARTER;   end   //
13:   begin note = SP;  duration = ONE;  end   //

14:   begin note = C5;  duration = QUARTER;  end   //
15:   begin note = SP;  duration = QUARTER;  end   //
16:   begin note = G4;  duration = QUARTER;  end   //
17:   begin note = SP; duration = QUARTER;   end   //
18:   begin note = E4;  duration = QUARTER;  end   //
19:   begin note = SP; duration = QUARTER;   end   //

20:   begin note = A4;  duration = QUARTER;  end   //
21:   begin note = SP; duration = QUARTER;   end   //
22:   begin note = B4;  duration = QUARTER;  end   //
23:   begin note = SP; duration = QUARTER;   end   //
24:   begin note = Bb4;  duration = QUARTER;  end   //
25:   begin note = SP; duration = QUARTER;   end   //
26:   begin note = A4;  duration = QUARTER;  end   //
27:   begin note = SP; duration = QUARTER;   end   //

28:   begin note = G4;  duration = QUARTER;  end   //
29:   begin note = SP; duration = QUARTER;   end   //
30:   begin note = E5;  duration = QUARTER;  end   //
31:   begin note = SP;  duration = QUARTER;  end   //
32:   begin note = G5;  duration = QUARTER;  end   //
33:   begin note = SP;  duration = QUARTER;  end   //  
34:   begin note = A5;  duration = QUARTER; end
35:   begin note = SP;  duration = QUARTER;  end   //

36:   begin note = F5;  duration = QUARTER; end
37:   begin note = SP;  duration = QUARTER;  end   //
38:   begin note = G5;  duration = QUARTER; end
39:   begin note = SP;  duration = QUARTER;  end   //  
40:   begin note = E5;  duration = QUARTER; end
41:   begin note = SP;  duration = QUARTER;  end   //
42:   begin note = C5;  duration = QUARTER; end
43:   begin note = SP;  duration = QUARTER;  end   //  
44:   begin note = D5;  duration = QUARTER; end
45:   begin note = SP;  duration = QUARTER;  end   //
46:   begin note = B4;  duration = QUARTER; end
47:   begin note = SP;  duration = ONE;  end   //  

48:   begin note = C5;  duration = QUARTER;  end   //
49:   begin note = SP;  duration = QUARTER;  end   //
50:   begin note = G4;  duration = QUARTER;  end   //
51:   begin note = SP; duration = QUARTER;   end   //
52:   begin note = E4;  duration = QUARTER;  end   //
53:   begin note = SP; duration = QUARTER;   end   //

54:   begin note = A4;  duration = QUARTER;  end   //
55:   begin note = SP; duration = QUARTER;   end   //
56:   begin note = B4;  duration = QUARTER;  end   //
57:   begin note = SP; duration = QUARTER;   end   //
58:   begin note = Bb4;  duration = QUARTER;  end   //
59:   begin note = SP; duration = QUARTER;   end   //
60:   begin note = A4;  duration = QUARTER;  end   //
61:   begin note = SP; duration = QUARTER;   end   //

62:   begin note = F5;  duration = QUARTER; end
63:   begin note = SP;  duration = QUARTER;  end   //
64:   begin note = G5;  duration = QUARTER; end
65:   begin note = SP;  duration = QUARTER;  end   //  
66:   begin note = E5;  duration = QUARTER; end
67:   begin note = SP;  duration = QUARTER;  end   //
68:   begin note = C5;  duration = QUARTER; end
69:   begin note = SP;  duration = QUARTER;  end   //  
70:   begin note = D5;  duration = QUARTER; end
71:   begin note = SP;  duration = QUARTER;  end   //
72:   begin note = B4;  duration = QUARTER; end
73:   begin note = SP;  duration = ONE;  end   // 

74:   begin note = G5;  duration = HALF;  end   // 
75:   begin note = Fs5;  duration = HALF;  end   // 
76:   begin note = F5;  duration = HALF;  end   // 
77:   begin note = D5;  duration = HALF;  end   // 
78:   begin note = E5;  duration = HALF;  end   // 

79:   begin note = G4;  duration = HALF;  end   // 
80:   begin note = A4;  duration = HALF;  end   // 
81:   begin note = C5;  duration = HALF;  end   // 
82:   begin note = A4;  duration = HALF;  end   // 
83:   begin note = C5;  duration = HALF;  end   // 
84:   begin note = D5;  duration = HALF;  end   // 
85:   begin note = SP;  duration = QUARTER;  end   // 

86:   begin note = C6;  duration = HALF;  end   // 
87:   begin note = SP;  duration = QUARTER;  end   // 
88:   begin note = C6;  duration = QUARTER;  end   // 
89:   begin note = SP;  duration = QUARTER;  end   // 
90:   begin note = C6;  duration = QUARTER;  end   // 
91:   begin note = SP;  duration = QUARTER;  end   // 

92:   begin note = G5;  duration = HALF;  end   // 
93:   begin note = Fs5;  duration = HALF;  end   // 
94:   begin note = F5;  duration = HALF;  end   // 
95:   begin note = D5;  duration = HALF;  end   // 
96:   begin note = E5;  duration = HALF;  end   // 

97:   begin note = G4;  duration = HALF;  end   // 
98:   begin note = A4;  duration = HALF;  end   // 
99:   begin note = C5;  duration = HALF;  end   // 
100:   begin note = A4;  duration = HALF;  end   // 
101:   begin note = C5;  duration = HALF;  end   // 
102:   begin note = D5;  duration = HALF;  end   // 
103:   begin note = SP;  duration = QUARTER;  end   // 

104:   begin note = Ds5;  duration = HALF;  end   // 
105:   begin note = SP;  duration = QUARTER;  end   // 
106:   begin note = D5;  duration = HALF;  end   // 
107:   begin note = SP;  duration = QUARTER;  end   // 
108:   begin note = C5;  duration = HALF;  end   // 
109:   begin note = SP;  duration = QUARTER;  end   // 

110:   begin note = C5;  duration = QUARTER;  end   // 
111:   begin note = SP;  duration = QUARTER;  end   // 
112:   begin note = C5;  duration = QUARTER;  end   // 
113:   begin note = SP;  duration = QUARTER;  end   // 
114:   begin note = C5;  duration = QUARTER;  end   // 
115:   begin note = SP;  duration = QUARTER;  end   // 

116:   begin note = C5;  duration = QUARTER;  end   // 
117:   begin note = SP;  duration = QUARTER;  end   // 
118:   begin note = D5;  duration = QUARTER;  end   // 
119:   begin note = SP;  duration = QUARTER;  end   // 
120:   begin note = E5;  duration = QUARTER;  end   // 
121:   begin note = SP;  duration = QUARTER;  end   // 

122:   begin note = C5;  duration = QUARTER;  end   // 
123:   begin note = SP;  duration = QUARTER;  end   // 
124:   begin note = A4;  duration = QUARTER;  end   // 
125:   begin note = SP;  duration = QUARTER;  end   // 
126:   begin note = G4;  duration = HALF;  end   // 
127:   begin note = SP;  duration = HALF;  end   // 

128:   begin note = C5;  duration = QUARTER;  end   // 
129:   begin note = SP;  duration = QUARTER;  end   // 
130:   begin note = C5;  duration = QUARTER;  end   // 
131:   begin note = SP;  duration = QUARTER;  end   // 
132:   begin note = C5;  duration = QUARTER;  end   // 
133:   begin note = SP;  duration = QUARTER;  end   // 

134:   begin note = C5;  duration = QUARTER;  end   // 
135:   begin note = SP;  duration = QUARTER;  end   // 
136:   begin note = D5;  duration = QUARTER;  end   // 
137:   begin note = SP;  duration = QUARTER;  end   // 
138:   begin note = E5;  duration = QUARTER;  end   // 
139:   begin note = SP;  duration = HALF;  end   // 

140:   begin note = C5;  duration = QUARTER;  end   // 
141:   begin note = SP;  duration = QUARTER;  end   // 
142:   begin note = C5;  duration = QUARTER;  end   // 
143:   begin note = SP;  duration = QUARTER;  end   // 
144:   begin note = C5;  duration = QUARTER;  end   // 
145:   begin note = SP;  duration = QUARTER;  end   // 

146:   begin note = C5;  duration = QUARTER;  end   // 
147:   begin note = SP;  duration = QUARTER;  end   // 
148:   begin note = D5;  duration = QUARTER;  end   // 
149:   begin note = SP;  duration = QUARTER;  end   // 
150:   begin note = E5;  duration = QUARTER;  end   // 
151:   begin note = SP;  duration = QUARTER;  end   // 

152:   begin note = C5;  duration = QUARTER;  end   // 
153:   begin note = SP;  duration = QUARTER;  end   // 
154:   begin note = A4;  duration = QUARTER;  end   // 
155:   begin note = SP;  duration = QUARTER;  end   // 
156:   begin note = G4;  duration = HALF;  end   // 
157:   begin note = SP;  duration = HALF;  end   // 

158:    begin note = C5; duration = QUARTER;   end   //your
159:    begin note = SP; duration = QUARTER;   end   //boat
160:    begin note = E5; duration = QUARTER;   end   //
161:    begin note = SP; duration = QUARTER;   end   //gently
162:   begin note = G5; duration = QUARTER;   end   //
163:   begin note = SP; duration = QUARTER;   end   //down
164:   begin note = G4; duration = QUARTER;   end   //
165:   begin note = SP;  duration = HALF;  end   //

166:   begin note = C5;  duration = QUARTER;  end   //
167:   begin note = SP;  duration = QUARTER;  end   //
168:   begin note = G4;  duration = QUARTER;  end   //
169:   begin note = SP; duration = QUARTER;   end   //
170:   begin note = E4;  duration = QUARTER;  end   //
171:   begin note = SP; duration = QUARTER;   end   //

172:   begin note = A4;  duration = QUARTER;  end   //
173:   begin note = SP; duration = QUARTER;   end   //
174:   begin note = B4;  duration = QUARTER;  end   //
175:   begin note = SP; duration = QUARTER;   end   //
176:   begin note = Bb4;  duration = QUARTER;  end   //
177:   begin note = SP; duration = QUARTER;   end   //
178:   begin note = A4;  duration = QUARTER;  end   //
179:   begin note = SP; duration = QUARTER;   end   //

180:   begin note = G4;  duration = QUARTER;  end   //
181:   begin note = SP; duration = QUARTER;   end   //
182:   begin note = E5;  duration = QUARTER;  end   //
183:   begin note = SP;  duration = QUARTER;  end   //
184:   begin note = G5;  duration = QUARTER;  end   //
185:   begin note = SP;  duration = QUARTER;  end   //  
186:   begin note = A5;  duration = QUARTER; end
187:   begin note = SP;  duration = QUARTER;  end   //

188:   begin note = F5;  duration = QUARTER; end
189:   begin note = SP;  duration = QUARTER;  end   //
190:   begin note = G5;  duration = QUARTER; end
191:   begin note = SP;  duration = QUARTER;  end   //  
192:   begin note = E5;  duration = QUARTER; end
193:   begin note = SP;  duration = QUARTER;  end   //
194:   begin note = C5;  duration = QUARTER; end
195:   begin note = SP;  duration = QUARTER;  end   //  
196:   begin note = D5;  duration = QUARTER; end
197:   begin note = SP;  duration = QUARTER;  end   //
198:   begin note = B4;  duration = QUARTER; end
199:   begin note = SP;  duration = ONE;  end   //  

200:   begin note = C5;  duration = QUARTER;  end   //
201:   begin note = SP;  duration = QUARTER;  end   //
202:   begin note = G4;  duration = QUARTER;  end   //
203:   begin note = SP; duration = QUARTER;   end   //
204:   begin note = E4;  duration = QUARTER;  end   //
205:   begin note = SP; duration = QUARTER;   end   //

206:   begin note = A4;  duration = QUARTER;  end   //
207:   begin note = SP; duration = QUARTER;   end   //
208:   begin note = B4;  duration = QUARTER;  end   //
209:   begin note = SP; duration = QUARTER;   end   //
210:   begin note = Bb4;  duration = QUARTER;  end   //
211:   begin note = SP; duration = QUARTER;   end   //
212:   begin note = A4;  duration = QUARTER;  end   //
213:   begin note = SP; duration = QUARTER;   end   //

214:   begin note = F5;  duration = QUARTER; end
215:   begin note = SP;  duration = QUARTER;  end   //
216:   begin note = G5;  duration = QUARTER; end
217:   begin note = SP;  duration = QUARTER;  end   //  
218:   begin note = E5;  duration = QUARTER; end
219:   begin note = SP;  duration = QUARTER;  end   //
220:   begin note = C5;  duration = QUARTER; end
221:   begin note = SP;  duration = QUARTER;  end   //  
222:   begin note = D5;  duration = QUARTER; end
223:   begin note = SP;  duration = QUARTER;  end   //
224:   begin note = B4;  duration = QUARTER; end
225:   begin note = SP;  duration = ONE;  end   // 

226:   begin note = E5;  duration = QUARTER;  end   //
227:   begin note = SP; duration = QUARTER;   end   //
228:   begin note = C5;  duration = QUARTER;  end   //
229:   begin note = SP; duration = QUARTER;   end   //
230:   begin note = G4;  duration = QUARTER;  end   //
231:   begin note = SP; duration = QUARTER;   end   //

232:   begin note = G4;  duration = QUARTER;  end   //
233:   begin note = SP; duration = QUARTER;   end   //
234:   begin note = A4;  duration = QUARTER;  end   //
235:   begin note = SP; duration = QUARTER;   end   //
236:   begin note = F5;  duration = QUARTER;  end   //
237:   begin note = SP; duration = QUARTER;   end   //
238:   begin note = F5;  duration = QUARTER;  end   //
239:   begin note = SP; duration = QUARTER;   end   //
240:   begin note = A4;  duration = QUARTER;  end   //
241:   begin note = SP; duration = ONE;   end   //

242:   begin note = B4;  duration = QUARTER; end
243:   begin note = SP;  duration = QUARTER;  end   //
244:   begin note = A5;  duration = QUARTER; end
245:   begin note = SP;  duration = QUARTER;  end   //  
246:   begin note = A5;  duration = QUARTER; end
247:   begin note = SP;  duration = QUARTER;  end   //
248:   begin note = A5;  duration = QUARTER; end
249:   begin note = SP;  duration = QUARTER;  end   //  
250:   begin note = G5;  duration = QUARTER; end
251:   begin note = SP;  duration = QUARTER;  end   //
252:   begin note = F5;  duration = QUARTER; end
253:   begin note = SP;  duration = QUARTER;  end   // 

254:   begin note = E5;  duration = QUARTER;  end   //
255:   begin note = SP; duration = QUARTER;   end   //
256:   begin note = C5;  duration = QUARTER;  end   //
257:   begin note = SP; duration = QUARTER;   end   //
258:   begin note = A4;  duration = QUARTER;  end   //
259:   begin note = SP; duration = QUARTER;   end   //
260:   begin note = G4;  duration = QUARTER;  end   //
261:   begin note = SP; duration = ONE;   end   //

262:   begin note = E5;  duration = QUARTER;  end   //
263:   begin note = SP; duration = QUARTER;   end   //
264:   begin note = C5;  duration = QUARTER;  end   //
265:   begin note = SP; duration = QUARTER;   end   //
266:   begin note = G4;  duration = QUARTER;  end   //
267:   begin note = SP; duration = QUARTER;   end   //

268:   begin note = G4;  duration = QUARTER;  end   //
269:   begin note = SP; duration = QUARTER;   end   //
270:   begin note = A4;  duration = QUARTER;  end   //
271:   begin note = SP; duration = QUARTER;   end   //
272:   begin note = F5;  duration = QUARTER;  end   //
273:   begin note = SP; duration = QUARTER;   end   //
274:   begin note = F5;  duration = QUARTER;  end   //
275:   begin note = SP; duration = QUARTER;   end   //
276:   begin note = A4;  duration = QUARTER;  end   //
277:   begin note = SP; duration = ONE;   end   //

278:   begin note = B4;  duration = QUARTER; end
279:   begin note = SP;  duration = QUARTER;  end   //
280:   begin note = F5;  duration = QUARTER; end
281:   begin note = SP;  duration = QUARTER;  end   //  
282:   begin note = F5;  duration = QUARTER; end
283:   begin note = SP;  duration = QUARTER;  end   //
284:   begin note = F5;  duration = QUARTER; end
285:   begin note = SP;  duration = QUARTER;  end   //  
286:   begin note = E5;  duration = QUARTER; end
287:   begin note = SP;  duration = QUARTER;  end   //
288:   begin note = D5;  duration = QUARTER; end
289:   begin note = SP;  duration = QUARTER;  end   // 
290:   begin note = C5;  duration = QUARTER; end
291:   begin note = SP;  duration = QUARTER;  end   //  

292:   begin note = G4;  duration = QUARTER; end
293:   begin note = SP;  duration = QUARTER;  end   //
294:   begin note = E4;  duration = QUARTER; end
295:   begin note = SP;  duration = QUARTER;  end   // 
296:   begin note = C4;  duration = QUARTER; end
297:   begin note = SP;  duration = ONE;  end   // 

298:   begin note = C5;  duration = QUARTER;  end   //
299:   begin note = SP;  duration = QUARTER;  end   //
300:   begin note = G4;  duration = QUARTER;  end   //
301:   begin note = SP; duration = QUARTER;   end   //
302:   begin note = E4;  duration = QUARTER;  end   //
303:   begin note = SP; duration = QUARTER;   end   //

304:   begin note = A4; duration = QUARTER;   end   //
305:   begin note = SP;  duration = QUARTER;  end   //
306:   begin note = B4; duration = QUARTER;   end   //
307:   begin note = SP; duration = QUARTER;   end   //
308:   begin note = A4;  duration = QUARTER;  end   //
309:   begin note = SP; duration = QUARTER;   end   //

310:   begin note = Gs4; duration = HALF;   end   //
311:   begin note = SP;  duration = QUARTER;  end   //
312:   begin note = Bb4; duration = HALF;   end   //
313:   begin note = SP; duration = QUARTER;   end   //
314:   begin note = Gs4;  duration = HALF;  end   //
315:   begin note = SP; duration = QUARTER;   end   //

316:   begin note = G4; duration = QUARTER;   end   //
317:   begin note = SP;  duration = QUARTER;  end   //
318:   begin note = Fs4; duration = QUARTER;   end   //
319:   begin note = SP; duration = QUARTER;   end   //
320:   begin note = G4;  duration = QUARTER;  end   //
321:   begin note = SP; duration = FOUR;   end   //

default:    begin note = C4; duration = FOUR;   end
endcase
end
endmodule


