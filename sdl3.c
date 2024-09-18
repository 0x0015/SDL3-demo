#include <stdio.h>
#include <stdbool.h>
#include <SDL3/SDL.h>

struct vec2{
	float x;
	float y;
};

int main(){
	SDL_Event event;
	printf("event size: %lu", sizeof(event));
	bool running = true;
	struct vec2 resolution = {720, 480};
	if(!SDL_Init(SDL_INIT_VIDEO)){
		printf("Failed to init SDL3 Video: %s\n",SDL_GetError());
		return -1;
	}
	SDL_Window* window = SDL_CreateWindow("springSim Window", resolution.x, resolution.y, 0b0);
	if(window == NULL){
		printf("Failed to create SDL3 Window: %s\n",SDL_GetError());
		return -1;
	}
	SDL_Renderer* renderer = SDL_CreateRenderer(window, NULL);
	if(renderer == NULL){
		printf("Failed to create SDL3 Renderer: %s\n",SDL_GetError());
		return -1;
	}
	//float lastFrameTime = SDL_GetTicks() / 1000.0f;

	while(running){
		while(SDL_PollEvent(&event)){
			if(event.type == SDL_EVENT_QUIT)
				running = false;
			if(event.type == SDL_EVENT_KEY_DOWN && event.key.key == SDLK_ESCAPE)
				running = false;
		}

		//float t = SDL_GetTicks() / 1000.0f;
		//float dt = t - lastFrameTime;
		//lastFrameTime = t;

		//SDL_SetRenderDrawColorFloat(renderer, 0.0f, 0.0f, 0.0f, 1.0f);
		//SDL_SetRenderDrawColor(
		SDL_RenderClear(renderer);

		//SDL_SetRenderDrawColorFloat(renderer, 1.0f, 0.0f, 0.0f, 1.0f);
		//SDL_FRect rect = {0, 0, 100, 100};
		//SDL_RenderRect(renderer, &rect);

		SDL_RenderPresent(renderer);
	}

	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();
}
