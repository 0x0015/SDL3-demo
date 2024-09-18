#include <stdio.h>
#include <stdbool.h>
#include <SDL3/SDL.h>

int main(){
	float resolutionX = 720;
	float resolutionY = 480;
	if(!SDL_Init(SDL_INIT_VIDEO)){
		printf("Failed to init SDL3 Video: %s\n",SDL_GetError());
		return -1;
	}
	SDL_Window* window = SDL_CreateWindow("SDL3 demo window (c version)", resolutionX, resolutionY, 0b0);
	if(window == NULL){
		printf("Failed to create SDL3 Window: %s\n",SDL_GetError());
		return -1;
	}
	SDL_Renderer* renderer = SDL_CreateRenderer(window, NULL);
	if(renderer == NULL){
		printf("Failed to create SDL3 Renderer: %s\n",SDL_GetError());
		return -1;
	}
	SDL_FRect rect = {0, 0, 100, 100};

	bool running = true;
	SDL_Event event;
	while(running){
		while(SDL_PollEvent(&event)){
			if(event.type == SDL_EVENT_QUIT)
				running = false;
			//if(event.type == SDL_EVENT_KEY_DOWN && event.key.key == SDLK_ESCAPE)
			//	running = false;
			//included as example code, but will not run to make performance theoretically the same
		}

		SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
		SDL_RenderClear(renderer);

		SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
		SDL_RenderRect(renderer, &rect);

		SDL_RenderPresent(renderer);
	}

	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();
}
